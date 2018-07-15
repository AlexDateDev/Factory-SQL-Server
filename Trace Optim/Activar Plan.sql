' -----------------------------------------------------------------------------
'                                       DTT 1.2.1.3  (c)2013 FSL - FreeSoftLand
'  Title: Activar Plan
'
'  Date : 12/09/2013
'  By   : Type here your name or nickname.
' -----------------------------------------------------------------------------

SET SHOWPLAN_TEXT ON/OFF
SET SHOWPLAN_FULL ON/OFF
set statistics io on/off

-- NOTA
-- Para crear íncidex en vistas, La vista debe definirse con SCHEMABINDING para crear un índice en ella


-- Para obtener información de los íncides
-- http://www.codeproject.com/Articles/291028/Speeding-up-database-access-Part-1-Missing-indexes

select d.name AS DatabaseName, mid.*
from sys.dm_db_missing_index_details mid
join sys.databases d ON mid.database_id=d.database_id


Column                Description
- DatabaseName        Name of the database this row relates to.
- equality_columns    Comma separated list of columns used with the equals operator, such as: column = value.
- inequality_columns  Comma separated list of columns used with a comparison operator other than the equals operator, such as: column > value.
- included_columns    Comma separated list of columns that could profitably be included in an index. Included columns will be discussed in Part 3 "Missing Indexes".
- statement           Name of the table where the index is missing.


SELECT
 est.text AS batchtext,
 SUBSTRING(est.text, (eqs.statement_start_offset/2)+1,
 (CASE eqs.statement_end_offset WHEN -1
 THEN DATALENGTH(est.text)
 ELSE eqs.statement_end_offset END -
 ((eqs.statement_start_offset/2) + 1))) AS querytext,
 eqs.creation_time, eqs.last_execution_time, eqs.execution_count,
 eqs.total_worker_time, eqs.last_worker_time,
 eqs.min_worker_time, eqs.max_worker_time,
 eqs.total_physical_reads, eqs.last_physical_reads,
 eqs.min_physical_reads, eqs.max_physical_reads,
 eqs.total_elapsed_time, eqs.last_elapsed_time,
 eqs.min_elapsed_time, eqs.max_elapsed_time,
 eqs.total_logical_writes, eqs.last_logical_writes,
 eqs.min_logical_writes, eqs.max_logical_writes,
 eqs.query_plan_hash
FROM
 sys.dm_exec_query_stats AS eqs
 CROSS APPLY sys.dm_exec_sql_text(eqs.sql_handle) AS est
ORDER BY eqs.total_physical_reads DESC

Column                 Description
- batchtext            Text of the entire batch or Stored Procedure containing the query.
- querytext            Text of the actual query.
- creation_time        Time that the execution plan was created.
- last_execution_time  Last time the plan was executed.
- execution_count      Number of times the plan was executed after it was created. This is not the number of times the query itself was executed - its plan may have been recompiled at some stage.
- total_worker_time    Total amount of CPU time, in microseconds, that was consumed by executions of this plan since it was created.
- last_worker_time     CPU time, in microseconds, that was consumed the last time the plan was executed.
- min_worker_time      Minimum CPU time, in microseconds, that this plan has ever consumed during a single execution.
- max_worker_time      Maximum CPU time, in microseconds, that this plan has ever consumed during a single execution.
- total_physical_reads Total number of physical reads performed by executions of this plan since it was compiled.
- last_physical_reads  Number of physical reads performed the last time the plan was executed.
- min_physical_reads   Minimum number of physical reads that this plan has ever performed during a single execution.
- max_physical_reads   Maximum number of physical reads that this plan has ever performed during a single execution.
- total_logical_writes Total number of logical writes performed by executions of this plan since it was compiled.
- last_logical_writes  Number of logical writes performed the last time the plan was executed.
- min_logical_writes   Minimum number of logical writes that this plan has ever performed during a single execution.
- max_logical_writes   Maximum number of logical writes that this plan has ever performed during a single execution.
- total_elapsed_time   Total elapsed time, in microseconds, for completed executions of this plan.
- last_elapsed_time    Elapsed time, in microseconds, for the most recently completed execution of this plan.
- min_elapsed_time     Minimum elapsed time, in microseconds, for any completed execution of this plan.
- max_elapsed_time     Maximum elapsed time, in microseconds, for any completed execution of this plan.


-- Indices no usados

SELECT d.name AS 'database name', t.name AS 'table name', i.name AS 'index name', ius.*
 FROM sys.dm_db_index_usage_stats ius
 JOIN sys.databases d ON d.database_id = ius.database_id AND ius.database_id=db_id()
 JOIN sys.tables t ON t.object_id = ius.object_id
 JOIN sys.indexes i ON i.object_id = ius.object_id AND i.index_id = ius.index_id
 ORDER BY user_updates DESC

If the number of updates is high in relation to the number of reads, consider dropping the index, like this:


