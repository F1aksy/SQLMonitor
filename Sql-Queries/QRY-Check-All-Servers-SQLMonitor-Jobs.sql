use DBA_Admin
go

select getutcdate(), sql_instance, JobName, JobCategory, Last_RunTime, Last_Run_Outcome,	Next_RunTime, Last_Successful_ExecutionTime
		,*
from [dbo].[sql_agent_jobs_all_servers] js
where 1=1
and js.JobCategory in ('(dba) SQLMonitor','(dba) Monitoring & Alerting')  and js.JobName like '(dba) %'
and IsDisabled = 0
and (	dateadd(minute,30,js.Next_RunTime) < GETUTCDATE() -- next schedule is crossed
	or	(	coalesce(Last_Successful_ExecutionTime,'1900-01-01') < dateadd(hour,-12,GETUTCDATE()) -- Last success was 24 hours earlier & last outcome is failed
		and	(Last_Run_Outcome = 'Failed' or Last_Run_Outcome is null)
		)
	)
go

/*
exec dbo.usp_GetAllServerCollectedData 
					--@servers = 'localhost', 
					@result_to_table = 'dbo.sql_agent_jobs_all_servers',
					@verbose = 2
go

exec sp_recompile 'dbo.usp_GetAllServerCollectedData'
go

*/