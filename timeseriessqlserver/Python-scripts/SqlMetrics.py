#!/usr/bin/python3.5

import pymssql
import datetime,time
from configparser import ConfigParser
import os
import re

def main():
	CheckBeforeExecute()

def CheckBeforeExecute():
	if Check_If_run_Script()==Gethostname():
		l=GetIP()
		for x in l:
			run_sql_file("/root/Scripts/SQLMetrics.sql",x.strip("'"))		

def Check_If_run_Script():
	freetest=str(os.popen(''' crm status | grep Masters: ''').read().splitlines())
	freetuple=tuple(freetest.split(":"))
	return freetuple[1].strip ("[ ' \n ]")

def GetVIP():
	lines=str(os.popen('''  crm config show |grep "params ip" ''').readlines())
	lines=tuple(lines.split(" "))
	return lines[1].strip("ip=")


def Gethostname():
	f=str(os.popen('''hostname''').read().splitlines())
	return f.strip ("[ ' ]")

def GetIP():
	lines=str(os.popen('''  crm status |grep "Online:" ''').read().splitlines())
	lines=tuple(lines.split(":"))
	pattern=lines[1].strip("[ ' ]").split(" ")
	iplist=[]
	for x in pattern:
		with open("/etc/hosts") as f:
			for line in f:
				if x in line:
					iplist.append(str(re.findall('\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}',line)).strip('[]'))
	return iplist


def run_sql_file(filename,host):
	config = ConfigParser()
	config.read("/root/Scripts/config.txt")
	username = config.get("configuration","uname")
	password = config.get("configuration","password")
	database='master'
	connectionnode = pymssql.connect(host, username, password, database)
	file = open(filename, 'r')
	sql = s = " ".join(file.readlines())
	cursor = connectionnode.cursor()
	cursor.execute(sql)
	records = cursor.fetchall()
	connectionnode.commit()
	connectionnode.close()
	run_sql_query(records,username, password,host)

def run_sql_query(records,uname,pname,servername):
	host =GetVIP()
	database ='MetricsCollector'
	connection = pymssql.connect(host, uname, pname, database)
	cursor = connection.cursor()
	if(len(records)>0):
		for row in records:
			SQLCommand = ("INSERT INTO SQL_Server_Metrics([ServerName],[Capture_Time],[Data_Value],[Data_Value_PerSecond],[Metric_ID],[Graph_ID]) VALUES (%s, %s, %s, %s, %s, %s)")    
			Values = (row[0],row[1],row[2],row[3],row[4],row[5])   
			cursor.execute(SQLCommand,Values) 
	else:
		SQLCommand = ("INSERT INTO SQL_Server_Metrics([ServerName],[Capture_Time],[Data_Value],[Data_Value_PerSecond],[Metric_ID],[Graph_ID]) VALUES (%s, %s, %s, %s, %s, %s)")    
		Values = (servername,datetime.datetime.now(),"","","","")   
		cursor.execute(SQLCommand,Values)
	cursor.close()  
	connection.commit()
	connection.close()


if __name__ == "__main__":
	main()
