USE Master
go

Drop Database if Exists [MetricsCollector]
go
Create Database [MetricsCollector]
Go

USE [MetricsCollector]
GO
/****** Object:  Table [dbo].[SQL_Metrics_Graph]    Script Date: 11/2/2018 2:47:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SQL_Metrics_Graph](
	[ID] [int] NOT NULL,
	[Graph_Name] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SQL_Metrics_Name]    Script Date: 11/2/2018 2:47:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SQL_Metrics_Name](
	[Category_Variable] [varchar](200) NULL,
	[Graph_ID] [tinyint] NOT NULL,
	[Category_Variable_ID] [tinyint] NOT NULL,
 CONSTRAINT [PK_SQL_Metrics_Name] PRIMARY KEY CLUSTERED 
(
	[Graph_ID] ASC,
	[Category_Variable_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[SQL_Metrics_Graph] ([ID], [Graph_Name]) VALUES (1, N'Always ON')
GO
INSERT [dbo].[SQL_Metrics_Graph] ([ID], [Graph_Name]) VALUES (2, N'Buffer Cache Disk')
GO
INSERT [dbo].[SQL_Metrics_Graph] ([ID], [Graph_Name]) VALUES (3, N'DataBase Activity')
GO
INSERT [dbo].[SQL_Metrics_Graph] ([ID], [Graph_Name]) VALUES (4, N'Memory Broker Clerk')
GO
INSERT [dbo].[SQL_Metrics_Graph] ([ID], [Graph_Name]) VALUES (5, N'Memory Manager')
GO
INSERT [dbo].[SQL_Metrics_Graph] ([ID], [Graph_Name]) VALUES (6, N'SQL Server Activity')
GO
INSERT [dbo].[SQL_Metrics_Graph] ([ID], [Graph_Name]) VALUES (7, N'Wait statistics')
GO
INSERT [dbo].[SQL_Metrics_Name] ([Category_Variable], [Graph_ID], [Category_Variable_ID]) VALUES (N'Bytes Sent to Replica/sec', 1, 1)
GO
INSERT [dbo].[SQL_Metrics_Name] ([Category_Variable], [Graph_ID], [Category_Variable_ID]) VALUES (N'Bytes Sent to Transport/sec', 1, 2)
GO
INSERT [dbo].[SQL_Metrics_Name] ([Category_Variable], [Graph_ID], [Category_Variable_ID]) VALUES (N'Log Apply Pending Queue', 1, 3)
GO
INSERT [dbo].[SQL_Metrics_Name] ([Category_Variable], [Graph_ID], [Category_Variable_ID]) VALUES (N'Log Apply Ready Queue', 1, 4)
GO
INSERT [dbo].[SQL_Metrics_Name] ([Category_Variable], [Graph_ID], [Category_Variable_ID]) VALUES (N'Log Bytes Flushed/sec', 1, 5)
GO
INSERT [dbo].[SQL_Metrics_Name] ([Category_Variable], [Graph_ID], [Category_Variable_ID]) VALUES (N'Log Bytes Received/sec', 1, 6)
GO
INSERT [dbo].[SQL_Metrics_Name] ([Category_Variable], [Graph_ID], [Category_Variable_ID]) VALUES (N'Recovery Queue', 1, 7)
GO
INSERT [dbo].[SQL_Metrics_Name] ([Category_Variable], [Graph_ID], [Category_Variable_ID]) VALUES (N'Redone Bytes/sec', 1, 8)
GO
INSERT [dbo].[SQL_Metrics_Name] ([Category_Variable], [Graph_ID], [Category_Variable_ID]) VALUES (N'Transaction Delay', 1, 9)
GO
INSERT [dbo].[SQL_Metrics_Name] ([Category_Variable], [Graph_ID], [Category_Variable_ID]) VALUES (N'Checkpoint pages/sec', 2, 1)
GO
INSERT [dbo].[SQL_Metrics_Name] ([Category_Variable], [Graph_ID], [Category_Variable_ID]) VALUES (N'Full Scans/sec', 2, 2)
GO
INSERT [dbo].[SQL_Metrics_Name] ([Category_Variable], [Graph_ID], [Category_Variable_ID]) VALUES (N'Index Searches/sec', 2, 3)
GO
INSERT [dbo].[SQL_Metrics_Name] ([Category_Variable], [Graph_ID], [Category_Variable_ID]) VALUES (N'Page life expectancy', 2, 4)
GO
INSERT [dbo].[SQL_Metrics_Name] ([Category_Variable], [Graph_ID], [Category_Variable_ID]) VALUES (N'Page lookups/sec', 2, 5)
GO
INSERT [dbo].[SQL_Metrics_Name] ([Category_Variable], [Graph_ID], [Category_Variable_ID]) VALUES (N'Page reads/sec', 2, 6)
GO
INSERT [dbo].[SQL_Metrics_Name] ([Category_Variable], [Graph_ID], [Category_Variable_ID]) VALUES (N'Page Splits/sec', 2, 7)
GO
INSERT [dbo].[SQL_Metrics_Name] ([Category_Variable], [Graph_ID], [Category_Variable_ID]) VALUES (N'Page writes/sec', 2, 8)
GO
INSERT [dbo].[SQL_Metrics_Name] ([Category_Variable], [Graph_ID], [Category_Variable_ID]) VALUES (N'Readahead pages/sec', 2, 9)
GO
INSERT [dbo].[SQL_Metrics_Name] ([Category_Variable], [Graph_ID], [Category_Variable_ID]) VALUES (N'Latch Waits/sec', 3, 1)
GO
INSERT [dbo].[SQL_Metrics_Name] ([Category_Variable], [Graph_ID], [Category_Variable_ID]) VALUES (N'Lock Timeouts/sec', 3, 2)
GO
INSERT [dbo].[SQL_Metrics_Name] ([Category_Variable], [Graph_ID], [Category_Variable_ID]) VALUES (N'Lock Waits/sec', 3, 3)
GO
INSERT [dbo].[SQL_Metrics_Name] ([Category_Variable], [Graph_ID], [Category_Variable_ID]) VALUES (N'Log Flushes/sec', 3, 4)
GO
INSERT [dbo].[SQL_Metrics_Name] ([Category_Variable], [Graph_ID], [Category_Variable_ID]) VALUES (N'Number of Deadlocks/sec', 3, 5)
GO
INSERT [dbo].[SQL_Metrics_Name] ([Category_Variable], [Graph_ID], [Category_Variable_ID]) VALUES (N'Transactions/sec', 3, 6)
GO
INSERT [dbo].[SQL_Metrics_Name] ([Category_Variable], [Graph_ID], [Category_Variable_ID]) VALUES (N'Write Transactions/sec', 3, 7)
GO
INSERT [dbo].[SQL_Metrics_Name] ([Category_Variable], [Graph_ID], [Category_Variable_ID]) VALUES (N'BufferPool', 4, 1)
GO
INSERT [dbo].[SQL_Metrics_Name] ([Category_Variable], [Graph_ID], [Category_Variable_ID]) VALUES (N'ColumnStore', 4, 2)
GO
INSERT [dbo].[SQL_Metrics_Name] ([Category_Variable], [Graph_ID], [Category_Variable_ID]) VALUES (N'Connection Memory (KB)', 5, 1)
GO
INSERT [dbo].[SQL_Metrics_Name] ([Category_Variable], [Graph_ID], [Category_Variable_ID]) VALUES (N'Database Cache Memory (KB)', 5, 2)
GO
INSERT [dbo].[SQL_Metrics_Name] ([Category_Variable], [Graph_ID], [Category_Variable_ID]) VALUES (N'Free Memory (KB)', 5, 3)
GO
INSERT [dbo].[SQL_Metrics_Name] ([Category_Variable], [Graph_ID], [Category_Variable_ID]) VALUES (N'Lock Memory (KB)', 5, 4)
GO
INSERT [dbo].[SQL_Metrics_Name] ([Category_Variable], [Graph_ID], [Category_Variable_ID]) VALUES (N'Log Pool Memory (KB) ', 5, 5)
GO
INSERT [dbo].[SQL_Metrics_Name] ([Category_Variable], [Graph_ID], [Category_Variable_ID]) VALUES (N'Maximum Workspace Memory (KB)', 5, 6)
GO
INSERT [dbo].[SQL_Metrics_Name] ([Category_Variable], [Graph_ID], [Category_Variable_ID]) VALUES (N'Optimizer Memory (KB)', 5, 7)
GO
INSERT [dbo].[SQL_Metrics_Name] ([Category_Variable], [Graph_ID], [Category_Variable_ID]) VALUES (N'Reserved Server Memory (KB) ', 5, 8)
GO
INSERT [dbo].[SQL_Metrics_Name] ([Category_Variable], [Graph_ID], [Category_Variable_ID]) VALUES (N'SQL Cache Memory (KB)', 5, 9)
GO
INSERT [dbo].[SQL_Metrics_Name] ([Category_Variable], [Graph_ID], [Category_Variable_ID]) VALUES (N'Stolen Server Memory (KB)', 5, 10)
GO
INSERT [dbo].[SQL_Metrics_Name] ([Category_Variable], [Graph_ID], [Category_Variable_ID]) VALUES (N'Target Server Memory (KB)', 5, 11)
GO
INSERT [dbo].[SQL_Metrics_Name] ([Category_Variable], [Graph_ID], [Category_Variable_ID]) VALUES (N'Total Server Memory (KB)', 5, 12)
GO
INSERT [dbo].[SQL_Metrics_Name] ([Category_Variable], [Graph_ID], [Category_Variable_ID]) VALUES (N'Batch Requests/sec', 6, 1)
GO
INSERT [dbo].[SQL_Metrics_Name] ([Category_Variable], [Graph_ID], [Category_Variable_ID]) VALUES (N'Logins/sec', 6, 2)
GO
INSERT [dbo].[SQL_Metrics_Name] ([Category_Variable], [Graph_ID], [Category_Variable_ID]) VALUES (N'Logouts/sec', 6, 3)
GO
INSERT [dbo].[SQL_Metrics_Name] ([Category_Variable], [Graph_ID], [Category_Variable_ID]) VALUES (N'SQL Compilations/sec', 6, 4)
GO
INSERT [dbo].[SQL_Metrics_Name] ([Category_Variable], [Graph_ID], [Category_Variable_ID]) VALUES (N'SQL Re-Compilations/sec', 6, 5)
GO
INSERT [dbo].[SQL_Metrics_Name] ([Category_Variable], [Graph_ID], [Category_Variable_ID]) VALUES (N'User Connections', 6, 6)
GO
INSERT [dbo].[SQL_Metrics_Name] ([Category_Variable], [Graph_ID], [Category_Variable_ID]) VALUES (N'ASYNC_IO_COMPLETION', 7, 1)
GO
INSERT [dbo].[SQL_Metrics_Name] ([Category_Variable], [Graph_ID], [Category_Variable_ID]) VALUES (N'ASYNC_NETWORK_IO', 7, 2)
GO
INSERT [dbo].[SQL_Metrics_Name] ([Category_Variable], [Graph_ID], [Category_Variable_ID]) VALUES (N'BACKUPBUFFER', 7, 3)
GO
INSERT [dbo].[SQL_Metrics_Name] ([Category_Variable], [Graph_ID], [Category_Variable_ID]) VALUES (N'BACKUPIO', 7, 4)
GO
INSERT [dbo].[SQL_Metrics_Name] ([Category_Variable], [Graph_ID], [Category_Variable_ID]) VALUES (N'CMEMTHREAD', 7, 5)
GO
INSERT [dbo].[SQL_Metrics_Name] ([Category_Variable], [Graph_ID], [Category_Variable_ID]) VALUES (N'CXCONSUMER', 7, 6)
GO
INSERT [dbo].[SQL_Metrics_Name] ([Category_Variable], [Graph_ID], [Category_Variable_ID]) VALUES (N'CXPACKET', 7, 7)
GO
INSERT [dbo].[SQL_Metrics_Name] ([Category_Variable], [Graph_ID], [Category_Variable_ID]) VALUES (N'HADR_CLUSAPI_CALL', 7, 8)
GO
INSERT [dbo].[SQL_Metrics_Name] ([Category_Variable], [Graph_ID], [Category_Variable_ID]) VALUES (N'HADR_LOGPROGRESS_SYNC', 7, 9)
GO
INSERT [dbo].[SQL_Metrics_Name] ([Category_Variable], [Graph_ID], [Category_Variable_ID]) VALUES (N'HADR_SYNC_COMMIT', 7, 10)
GO
INSERT [dbo].[SQL_Metrics_Name] ([Category_Variable], [Graph_ID], [Category_Variable_ID]) VALUES (N'HADR_TIMER_TASK', 7, 11)
GO
INSERT [dbo].[SQL_Metrics_Name] ([Category_Variable], [Graph_ID], [Category_Variable_ID]) VALUES (N'HADR_WORK_QUEUE', 7, 12)
GO
INSERT [dbo].[SQL_Metrics_Name] ([Category_Variable], [Graph_ID], [Category_Variable_ID]) VALUES (N'IO_COMPLETION', 7, 13)
GO
INSERT [dbo].[SQL_Metrics_Name] ([Category_Variable], [Graph_ID], [Category_Variable_ID]) VALUES (N'LATCH_NL', 7, 14)
GO
INSERT [dbo].[SQL_Metrics_Name] ([Category_Variable], [Graph_ID], [Category_Variable_ID]) VALUES (N'LOGPOOL_FREEPOOLS', 7, 15)
GO
INSERT [dbo].[SQL_Metrics_Name] ([Category_Variable], [Graph_ID], [Category_Variable_ID]) VALUES (N'LOGPOOL_REPLACEMENTSET', 7, 16)
GO
INSERT [dbo].[SQL_Metrics_Name] ([Category_Variable], [Graph_ID], [Category_Variable_ID]) VALUES (N'MEMORY_ALLOCATION_EXT', 7, 17)
GO
INSERT [dbo].[SQL_Metrics_Name] ([Category_Variable], [Graph_ID], [Category_Variable_ID]) VALUES (N'PAGEIOLATCH_NL', 7, 18)
GO
INSERT [dbo].[SQL_Metrics_Name] ([Category_Variable], [Graph_ID], [Category_Variable_ID]) VALUES (N'PAGELATCH_NL', 7, 19)
GO
INSERT [dbo].[SQL_Metrics_Name] ([Category_Variable], [Graph_ID], [Category_Variable_ID]) VALUES (N'QDS_ASYNC_QUEUE', 7, 20)
GO
INSERT [dbo].[SQL_Metrics_Name] ([Category_Variable], [Graph_ID], [Category_Variable_ID]) VALUES (N'RESERVED_MEMORY_ALLOCATION_EXT', 7, 21)
GO
INSERT [dbo].[SQL_Metrics_Name] ([Category_Variable], [Graph_ID], [Category_Variable_ID]) VALUES (N'SEQUENCE_GENERATION', 7, 22)
GO
INSERT [dbo].[SQL_Metrics_Name] ([Category_Variable], [Graph_ID], [Category_Variable_ID]) VALUES (N'SESSION_WAIT_STATS_CHILDREN', 7, 23)
GO
INSERT [dbo].[SQL_Metrics_Name] ([Category_Variable], [Graph_ID], [Category_Variable_ID]) VALUES (N'SOS_PROCESS_AFFINITY_MUTEX', 7, 24)
GO
INSERT [dbo].[SQL_Metrics_Name] ([Category_Variable], [Graph_ID], [Category_Variable_ID]) VALUES (N'SOS_SCHEDULER_YIELD', 7, 25)
GO
INSERT [dbo].[SQL_Metrics_Name] ([Category_Variable], [Graph_ID], [Category_Variable_ID]) VALUES (N'UCS_SESSION_REGISTRATION', 7, 26)
GO
INSERT [dbo].[SQL_Metrics_Name] ([Category_Variable], [Graph_ID], [Category_Variable_ID]) VALUES (N'VDI_CLIENT_OTHER', 7, 27)
GO
INSERT [dbo].[SQL_Metrics_Name] ([Category_Variable], [Graph_ID], [Category_Variable_ID]) VALUES (N'WRITELOG ', 7, 28)
GO
/****** Object:  StoredProcedure [dbo].[SQL_Metrics_Collection]    Script Date: 11/2/2018 2:47:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Create table SQL_Stats(Capture_Time datetime,[Data_Value] int,[Data_Value_PerSecond] bigint,Metric_ID tinyint,Graph_ID tinyint)

CREATE Procedure [dbo].[SQL_Metrics_Collection]
as
begin

DECLARE @DATEDEMARRAGE datetime

SELECT @DATEDEMARRAGE = create_date FROM sys.databases
WHERE name ='tempdb'
--WITH SQLSTATS AS
--(
--select getdate() as Capture_Time,db_name(mf.database_id) as DBName, 
--left(mf.physical_name, 1) as driveLetter, 
--sum(vfs.num_of_writes) [totalNumOfWrites],
--sum(vfs.num_of_bytes_written) [totalNumOfBytesWritten],
--sum(vfs.num_of_reads) [totalNumOfReads], 
--sum(vfs.num_of_bytes_read) [totalNumOfBytesRead], 
--cast(SUM(num_of_bytes_read + num_of_bytes_written)/1024 AS DECIMAL(12, 2)) AS [TotIO(MB)],
--MAX(cast(vfs.size_on_disk_bytes/1024/1024.00 as decimal(10,2))) SizeMB
--from sys.master_files mf
--join sys.dm_io_virtual_file_stats(NULL, NULL) vfs
--on mf.database_id=vfs.database_id and mf.file_id=vfs.file_id
----where mf.database_Id >4
--GROUP BY mf.database_id,left(mf.physical_name, 1)
--)


--insert into db1.dbo.SQL_IO_Stats(Capture_Time,I_O_Rank,DBName,Total_Writes,Total_Byte_Write,Total_Read,Total_Byte_Read,Total_IO_MB,Total_IO_Per,Disk_Size_MB)
--SELECT Capture_Time,ROW_NUMBER() OVER(ORDER BY [TotIO(MB)] DESC) AS [I/ORank],[dbname],
--	--driveLetter,
--	[totalNumOfWrites],totalNumOfBytesWritten,totalNumOfReads,totalNumOfBytesRead,
--	[TotIO(MB)],CAST([TotIO(MB)]/ SUM([TotIO(MB)]) OVER() * 100.0 AS DECIMAL(5,2)) AS [I/O(%)],SizeMB
--	FROM SQLSTATS
--	--ORDER BY [I/ORank]
--OPTION (RECOMPILE)


--insert into db1.dbo.CQL_OS_PERF
--select getdate(),* from
--((
--SELECT counter_name,cntr_value
--,(CASE object_name WHEN 'SQLServer:SQL Statistics' THEN 'SQL Statistics'
--when 'SQLServer:Transactions' THEN 'SQL transcation'
--WHEN 'SQLServer:Latches' then 'latches'
--END) AS SECTION
--FROM sys.dm_os_performance_counters 
--WHERE object_name IN ('SQLServer:SQL Statistics','SQLServer:Transactions','SQLServer:Latches')
-- and counter_name in ('Batch Requests/sec','SQL Compilations/sec','SQL Re-Compilations/sec','SQL Attention rate'
-- ,'Transactions','Free Space in tempdb (KB)'
-- ,'Latch Waits/sec','Average Latch Wait Time (ms)','Average Latch Wait Time Base','Total Latch Wait Time (ms)') 
-- )
-- union 
-- (
----AND cntr_value != 0;
--SELECT counter_name,cntr_value,(CASE object_name WHEN 'SQLServer:Databases' THEN 'SQL DB'
--when 'SQLServer:Database Replica' THEN 'SQL DB Replica'
--WHEN 'SQLServer:Locks' then 'Locks'
--END) AS SECTION
--FROM sys.dm_os_performance_counters 
--WHERE object_name in ('SQLServer:Databases' ,'SQLServer:Database Replica','SQLServer:Locks')
--and counter_name in ('Data File(s) Size (KB)','Log File(s) Size (KB)','Log File(s) Used Size (KB)','Percent Log Used','Active Transactions','Transactions/sec','Log Flushes/sec','Write Transactions/sec'
--,'Mirrored Write Transactions/sec','Transaction Delay','Group Commit Time','Group Commits/Sec'
--,'Lock Requests/sec','Lock Timeouts/sec','Number of Deadlocks/sec','Lock Waits/sec','Lock Wait Time (ms)','Average Wait Time (ms)','Average Wait Time Base','Lock Timeouts (timeout > 0)/sec') 
--and instance_name='_Total'))X



--WITH SQL_CPUStats
--AS
--(SELECT DatabaseID, DB_Name(DatabaseID) AS [DatabaseName], SUM(total_worker_time) AS [CPU_Time_Ms],  SUM(execution_count)  AS [ExecutionCount],
--SUM(total_rows)  AS [RowsReturned],getdate() as Capture_Time
--FROM sys.dm_exec_query_stats AS qs WITH (NOLOCK)
--CROSS APPLY (SELECT CONVERT(int, value) AS [DatabaseID]
--FROM sys.dm_exec_plan_attributes(qs.plan_handle)
--WHERE attribute = N'dbid') AS F_DB
--GROUP BY DatabaseID)


--insert into db1.dbo.SQL_CPU_STATS(Capture_Time,CPU_Rank,DBName,CPU_Time_MS,CPU_Per,RowsRetured,ExecutionCount)
--SELECT Capture_Time, ROW_NUMBER() OVER(ORDER BY [CPU_Time_Ms] DESC) AS [row_num],
--DatabaseName, [CPU_Time_Ms],
--CAST([CPU_Time_Ms] * 1.0 / SUM([CPU_Time_Ms]) OVER() * 100.0 AS DECIMAL(5, 2)) AS [CPUPercent],
--[RowsReturned],
--[ExecutionCount]
--FROM SQL_CPUStats
--WHERE 
----DatabaseID > 4 -- system databases
----AND 
--DatabaseID <> 32767 -- ResourceDB
--ORDER BY row_num OPTION (RECOMPILE)
insert into [SQL_Stats]
select getdate(), CountValue,(case when cntr_type=272696576 then  Per_secondValue/datediff (second,@DATEDEMARRAGE,getdate()) else Per_secondValue end)Per_secondValue
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



--order by GraphName,counter_name
END
GO


/****** Object:  Table [dbo].[SQL_Stats]    Script Date: 11/2/2018 2:44:26 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SQL_Server_Metrics](
	[ServerName] [varchar](100) NOT NULL,
	[Capture_Time] [datetime] NOT NULL,
	[Data_Value] [int] NULL,
	[Data_Value_PerSecond] [bigint] NULL,
	[Metric_ID] [tinyint] NOT NULL,
	[Graph_ID] [tinyint] NOT NULL,
 CONSTRAINT [PK_SQL_Server_Metrics] PRIMARY KEY CLUSTERED 
(
	[ServerName] ASC,
	[Metric_ID] ASC,
	[Graph_ID] ASC,
	[Capture_Time] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO




/****** Object:  Table [dbo].[SQLHardwareMetrics]    Script Date: 11/2/2018 2:44:27 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SQLHardwareMetrics](
	[Servername] [varchar](100) NOT NULL,
	[capture_time] [datetime] NOT NULL,
	[cpu_idle] [float] NULL,
	[cpu_interrup] [float] NULL,
	[cpu_nice] [float] NULL,
	[cpu_softirq] [float] NULL,
	[cpu_steal] [float] NULL,
	[cpu_system] [float] NULL,
	[cpu_user] [float] NULL,
	[cpu_wait] [float] NULL,
	[Uptime] [bigint] NULL,
	[Mem_free] [int] NULL,
	[Mem_cached] [int] NULL,
	[Mem_Used] [int] NULL,
	[Load_Short_term] [float] NULL,
	[ps_rss] [float] NULL,
	[ps_cputime_system] [float] NULL,
	[ps_cputime_user] [float] NULL,
	[ps_count] [int] NULL,
	[ps_disk_ops_write] [float] NULL,
	[ps_disk_ops_read] [float] NULL,
	[Network_traffic_eth0_rx] [bigint] NULL,
	[Network_traffic_eth0_tx] [bigint] NULL,
	[Network_traffic_eth1_rx] [bigint] NULL,
	[Network_traffic_eth1_tx] [bigint] NULL,
	[Network_packets_eth0_rx] [bigint] NULL,
	[Network_packets_eth0_tx] [bigint] NULL,
	[Network_packets_eth1_rx] [bigint] NULL,
	[Network_packets_eth1_tx] [bigint] NULL,
	[Free_space_Host] [int] NULL,
	[Free_space_Host_boot] [int] NULL,
	[ps_count_sql] [int] NULL,
	[ps_rss_process] [int] NULL,
	[SQL_Mem_Free] [float] NULL,
	[SQL_Mem_Cached] [float] NULL,
	[SQL_Mem_Used] [float] NULL,
 CONSTRAINT [PK_SQLHardwareMetrics] PRIMARY KEY CLUSTERED 
(
	[Servername] ASC,
	[capture_time] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO