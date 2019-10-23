#!/usr/bin/python3.5

import os
import pymssql
import datetime
from configparser import ConfigParser

def main():
	lisvalues=GetNetworkInterfaces()
	for j in lisvalues:
		if(j.get('interface')=='eth0'):
			listvaluesrx=j.get('rx')
			listvaluestx=j.get('tx')
			eth0_p_rx=listvaluesrx.get('packets')
			eth0_b_rx=listvaluesrx.get('bytes')
			eth0_p_tx=listvaluestx.get('packets')
			eth0_b_tx=listvaluestx.get('bytes')
		elif(j.get('interface')=='eth1'):
			listvaluesrx=j.get('rx')
			listvaluestx=j.get('tx')
			eth1_p_rx=listvaluesrx.get('packets')
			eth1_b_rx=listvaluesrx.get('bytes')
			eth1_p_tx=listvaluestx.get('packets')
			eth1_b_tx=listvaluestx.get('bytes')

	rw=GetDiskReadWrite()
	psval=GetProcessesValues()
	LoadShortTerm_SQL=psval[3].strip("load average:")
	ps_count_SQL=psval[6].strip(''' 'Tasktotol: ''')
	ps_cputime_User_SQL=psval[11].split(":")[1].strip('us')
	ps_cputime_System_SQL=psval[12].strip('sy')
	ps_mem_free_SQL=round(float(psval[20].strip('free'))/1048576,3)
	ps_mem_used_SQL=round(float(psval[21].strip('used'))/1048576,3)
	ps_mem_cached_SQL=round(float(psval[22].strip("  buff/cache' "))/1048576,3)
	if (psval[28].split()[6]).isdigit():
		psrss_SQL=psval[29].split()[6].strip("g")
	else:
		psrss_SQL=psval[28].split()[6].strip("g")
	cpu=GetCPU_Usage()
	cpuuser=cpu[0].strip("us")
	cpunice=cpu[2].strip("ni")
	cpusystem=cpu[1].strip("sy")
	cpuidle=cpu[3].strip("id")
	cpuwait=cpu[4].strip("wa")
	cpuinterrupt=cpu[5].strip("hi")
	cpusoftirq=cpu[6].strip("si")
	cpusteal=cpu[7].strip("st")
	mem=GetMemory()
	mem_kib = mem['MemTotal']/1048576
	memFree_kib = mem['MemFree']/1048576
	memCached_kib = mem['Cached']/1048576
	memUsed_kib = mem_kib-memFree_kib
	freepace=Getfreespace()
	freehost=freepace[1].strip(" ,' ")
	freehostboot=freepace[2].strip(" ,' ")
	
	
	host =GetVIP()
	config = ConfigParser()
	config.read("/root/Scripts/config.txt")
	username = config.get("configuration","uname")
	password = config.get("configuration","password")
	database ='MetricsCollector'
	connection = pymssql.connect(host, username, password , database)
	cursor = connection.cursor()  
	SQLCommand = ("INSERT INTO SQLHardwareMetrics([Servername],[capture_time],[cpu_idle],[cpu_interrup],[cpu_nice],[cpu_softirq],[cpu_steal],[cpu_system],[cpu_user],[cpu_wait],[Uptime],[Mem_free],[Mem_cached],[Mem_Used],[Network_traffic_eth0_rx],[Network_traffic_eth0_tx],[Network_traffic_eth1_rx],[Network_traffic_eth1_tx],[Network_packets_eth0_rx],[Network_packets_eth0_tx],[Network_packets_eth1_rx],[Network_packets_eth1_tx],[Free_space_Host],[Free_space_Host_boot],[Load_Short_term],[ps_rss],[ps_cputime_system],[ps_cputime_user],[ps_count],[ps_count_sql],[ps_disk_ops_write],[ps_disk_ops_read],[ps_rss_process],[SQL_Mem_Free],[SQL_Mem_Cached] ,[SQL_Mem_Used]) VALUES (%s,%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)")    
	Values = (Gethostname(),datetime.datetime.now(),cpuidle,cpuinterrupt,cpunice,cpusoftirq,cpusteal,cpusystem,cpuuser,cpuwait,GetUptime(),memFree_kib,memCached_kib,memUsed_kib,eth0_b_rx,eth0_b_tx,eth1_b_rx,eth1_b_tx,eth0_p_rx,eth0_p_tx,eth1_p_rx,eth1_p_tx,freehost,freehostboot,LoadShortTerm_SQL,psrss_SQL,ps_cputime_System_SQL,ps_cputime_User_SQL,GetProcessCount(),ps_count_SQL,rw[0].strip(" [' "),rw[1].strip(" '] "),Getpsrss(),ps_mem_free_SQL,ps_mem_cached_SQL,ps_mem_used_SQL)      
	cursor.execute(SQLCommand,Values)         
	connection.commit()    
	connection.close()

def GetVIP():
	lines=str(os.popen('''  crm config show |grep "params ip" ''').readlines())
	lines=tuple(lines.split(" "))
	#print(lines[1].strip("ip="))
	return lines[1].strip("ip=")
	

def GetLoadShortTerm():
	f=open("/proc/loadavg")
	data=f.read()
	#print(data.split(" ")[0])
	return  data.split(" ")[0]

def GetDiskReadWrite():
    f=str(os.popen(''' iostat | awk 'NR>4 {sum+=$3}{sum1+=$4} END {print sum,sum1}' ''').read().splitlines())
    #print(f.split(" "))
    return f.split(" ")

def GetProcessCount():
	f=str(os.popen(''' ps aux |wc -l ''').read().splitlines())
	#print(f)
	return f.strip("[]'")

def GetProcessesValues():
	proeccess=str(os.popen(''' top -b -n 1 -u mssql''').read().splitlines())
	proeccessvalues=proeccess.splitlines()
	for line in proeccessvalues:
		Type = line.split(",")
	#print(Type)
	return Type 
def GetCPU_Usage():
	f=str(os.popen(''' top -bn1 | grep "Cpu(s)" ''').readlines())
	T_ind=f.index(':')
	f=f[T_ind+1:-4]
	cputuple=tuple(f.split(","))
	#print(cputuple)
	return cputuple
def GetUptime():
	f=open("/proc/uptime",'r')
	data=float(f.readline().split()[0])
	#print(data)
	return int(data)

def GetMemory():
	meminfo = dict((i.split()[0].rstrip(':'),int(i.split()[1])) for i in open('/proc/meminfo').readlines())
	#print(meminfo)
	return meminfo

def Getpsrss():
	f=str(os.popen(''' ps aux -n1|grep -E "USER|mssql|/opt/mssql/bin/sqlservr" | awk 'NR<=3 {sum+=$6} END {print sum} ' ''').read().splitlines())
	return f.strip("[]'")

def Getfreespace():
	freetest=str(os.popen(''' df -h | grep -E "Mounted|/$|/boot"  | awk '{print $5}' ''').read().splitlines())
	freetuple=tuple(freetest.split("%"))
	#print(freetuple)
	return freetuple

def Gethostname():
	f=str(os.popen('''hostname''').read().splitlines())
	#print(f)
	return f.strip("[]'")

def GetNetworkInterfaces():

    ifaces = []

    f = open("/proc/net/dev")

    data = f.read()

    f.close()

    data = data.split("\n")[2:]

    for i in data:

        if len(i.strip()) > 0:

            x = i.split()

            # Interface |                        Receive                          |                         Transmit

            #   iface   | bytes packets errs drop fifo frame compressed multicast | bytes packets errs drop fifo frame compressed multicast

            k = {

                "interface" :   x[0][:len( x[0])-1],   

                "tx"        :   {

                    "bytes"         :   int(x[1]),

                    "packets"       :   int(x[2]),

                    
                },

                "rx"        :   {

                    "bytes"         :   int(x[9]),

                    "packets"       :   int(x[10]),

                    
                }

            }

            ifaces.append(k)
    #print(ifaces)	
    return ifaces

	
if __name__ == "__main__":
    main()
