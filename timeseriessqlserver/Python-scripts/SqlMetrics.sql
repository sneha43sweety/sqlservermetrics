DECLARE @DATEDEMARRAGE datetime

SELECT @DATEDEMARRAGE = create_date FROM sys.databases
WHERE name ='tempdb'
select @@SERVERNAME AS SNAME,getdate() as Stime, CountValue,(case when cntr_type=272696576 then  Per_secondValue/datediff (second,@DATEDEMARRAGE,getdate()) else Per_secondValue end)Per_secondValue
,ROW_NUMBER() over(partition by GraphName order by GraphName,counter_name ) as Category_Variable_ID,DENSE_RANK() over( order by GraphName ) Graph_ID from 
(SELECT [object_name] as CategoryName,[counter_name],
(case when [counter_name]  in ('User Connections','Page life expectancy','Log Apply Ready Queue','Log Apply Pending Queue','Recovery Queue','Transaction Delay') then [cntr_value]   
else null end) CountValue
,(case when [counter_name] not in ('User Connections','Page life expectancy','Log Apply Ready Queue','Log Apply Pending Queue','Recovery Queue','Transaction Delay') then [cntr_value] 
else null end) as Per_secondValue 
,(case when counter_name='Log Bytes Flushed/sec' then 'Always ON' 
when [object_name]='SQLServer:General Statistics' then 'SQL Server Activity'
when [object_name]='SQLServer:SQL Statistics' then 'SQL Server Activity'
when [object_name]='SQLServer:Buffer Manager' then 'Buffer Cache Disk'
when [object_name]='SQLServer:Access Methods' then 'Buffer Cache Disk'
when [object_name]='SQLServer:Memory Manager' then 'Memory Manager'
when [object_name]='SQLServer:Availability Replica' then 'Always ON'
when [object_name]='SQLServer:Database Replica' then 'Always ON'
--when [object_name]='SQLServer:Database Replica' and counter_name='Transaction Delay' then 'Always ON(Transaction_delay)'
else 'DataBase Activity' end) as GraphName
,cntr_type 
FROM sys.dm_os_performance_counters 
where [object_name] in ('SQLServer:Databases','SQLServer:Latches','SQLServer:Locks','SQLServer:General Statistics','SQLServer:SQL Statistics'
,'SQLServer:Buffer Manager','SQLServer:Access Methods','SQLServer:Memory Manager','SQLServer:Availability Replica','SQLServer:Database Replica')
and [instance_name] in (case [object_name] when 'SQLServer:Latches' then ''
when 'SQLServer:General Statistics' then ''
when 'SQLServer:SQL Statistics' then ''
when 'SQLServer:Buffer Manager' then ''
when 'SQLServer:Access Methods' then ''
when 'SQLServer:Memory Manager' then ''
when 'SQLServer:Availability Replica' then ''
else '_Total' 
end)
and counter_name in ('Log Flushes/sec','Write Transactions/sec','Transactions/sec','Log Bytes Flushed/sec'
,'Latch Waits/sec'
,'Lock Waits/sec','Number of Deadlocks/sec','Lock Timeouts/sec'
,'User Connections','Logins/sec','Logouts/sec' 
,'Batch Requests/sec','SQL Compilations/sec','SQL Re-Compilations/sec'
,'Page lookups/sec','Checkpoint pages/sec','Page reads/sec','Page writes/sec','Readahead pages/sec','Page life expectancy'
,'Full Scans/sec','Index Searches/sec','Page Splits/sec'
,'Database Cache Memory (KB)','SQL Cache Memory (KB)','Connection Memory (KB)','Lock Memory (KB)','Log Pool Memory (KB)','Optimizer Memory (KB)'
,'Free Memory (KB)','Maximum Workspace Memory (KB)','Reserved Server Memory (KB)','Stolen Server Memory (KB)','Target Server Memory (KB)','Total Server Memory (KB)'
,'Bytes Sent to Transport/sec','Bytes Sent to Replica/sec'
,'Log Apply Ready Queue','Log Apply Pending Queue','Recovery Queue','Redone Bytes/sec','Log Bytes Received/sec'
,'Transaction Delay')
union all
SELECT 'Wait statistics' as CategoryName, wait_type [counter_name],waiting_tasks_count as CountValue,FLOOR(wait_time_ms*(0.001)) Per_secondValue ,'Wait statistics' as GraphName,0
FROM sys.dm_os_wait_stats where 
wait_type in ('ASYNC_IO_COMPLETION','ASYNC_NETWORK_IO','BACKUPBUFFER','BACKUPIO','CMEMTHREAD','CXCONSUMER','CXPACKET','HADR_CLUSAPI_CALL'
,'HADR_LOGPROGRESS_SYNC','HADR_SYNC_COMMIT','HADR_TIMER_TASK','HADR_WORK_QUEUE','IO_COMPLETION','LATCH_NL','LOGPOOL_FREEPOOLS','LOGPOOL_REPLACEMENTSET'
,'MEMORY_ALLOCATION_EXT','PAGEIOLATCH_NL','PAGELATCH_NL','QDS_ASYNC_QUEUE','RESERVED_MEMORY_ALLOCATION_EXT','SEQUENCE_GENERATION','SESSION_WAIT_STATS_CHILDREN'
,'SOS_PROCESS_AFFINITY_MUTEX','SOS_SCHEDULER_YIELD','UCS_SESSION_REGISTRATION','VDI_CLIENT_OTHER','WRITELOG')
union all
select 'Memory Broker Clerks' as CategoryName,instance_name as [counter_name],cntr_value,null,'Memory Broker Clerks' as GraphName,cntr_type
 from sys.dm_os_performance_counters 
where object_name='SQLServer:Memory Broker Clerks' and counter_name='Memory broker clerk size'
)X

