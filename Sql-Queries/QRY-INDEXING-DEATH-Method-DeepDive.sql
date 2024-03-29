use DBA_Admin
go
set nocount on;
declare @sql nvarchar(max);
declare @params nvarchar(2000);
declare @more_info_filter varchar(2000);
declare @table_name varchar(2000);
declare @run_datetime_mode0 datetime = '2023-07-07 20:15:00.000';
declare @run_datetime_mode2 datetime = '2023-07-13 19:12:00.000';
declare @run_datetime_mode4 datetime = '2023-07-07 20:39:00.000';

set @params = '@more_info_filter varchar(2000), @run_datetime_mode0 datetime, @run_datetime_mode4 datetime, @run_datetime_mode2 datetime, @table_name varchar(2000) output';

set quoted_identifier off;
set @more_info_filter = "EXEC dbo.sp_BlitzIndex @DatabaseName='BSEDB_AB', @SchemaName='dbo', @TableName='AngelDupCheque';";
set @sql = "
select [result] = 'High-Priority', finding, details, index_usage_summary, index_size_summary, more_info, create_tsql, sample_query_plan, total_forwarded_fetch_count, url
from dbo.BlitzIndex_Mode0 bi
where 1=1
--and bi.priority = -1 -- Use it to find out stats for max UpTime Days
and bi.run_datetime = @run_datetime_mode0
"+(case when @more_info_filter is null then '-- ' else '' end)+"and bi.more_info = @more_info_filter;

select [result] = 'Index-Usage', [table_name] = quotename(bi.database_name)+'.'+quotename(bi.schema_name)+'.'+quotename(bi.table_name),
		bi.index_name, bi.index_definition, bi.index_size_summary, bi.data_compression_desc, 
		bi.index_usage_summary, bi.index_op_stats, bi.Create_Tsql, bi.Drop_Tsql, 
		bi.db_schema_object_indexid, bi.total_rows, bi.more_info
from dbo.BlitzIndex bi
where 1=1
and bi.run_datetime = @run_datetime_mode2
"+(case when @more_info_filter is null then '-- ' else '' end)+"and bi.more_info = @more_info_filter;

select [result] = 'All-Priority', finding, details, index_usage_summary, index_size_summary, more_info, create_tsql, sample_query_plan, total_forwarded_fetch_count, url
from dbo.BlitzIndex_Mode4 bi
where 1=1
--and bi.priority = -1 -- Use it to find out stats for max UpTime Days
and bi.run_datetime = @run_datetime_mode4
"+(case when @more_info_filter is null then '-- ' else '' end)+"and bi.more_info = @more_info_filter;

if(@more_info_filter is not null)
begin
	select @table_name = quotename(bi.database_name)+'.'+quotename(bi.schema_name)+'.'+quotename(bi.table_name)
	from dbo.BlitzIndex bi
	where 1=1
	and bi.run_datetime = @run_datetime_mode2
	and bi.index_id <= 1
	"+(case when @more_info_filter is null then '-- ' else '' end)+"and bi.more_info = @more_info_filter;
end
";
set quoted_identifier on;
print @sql;
exec sp_executesql @sql, @params, @more_info_filter, @run_datetime_mode0, @run_datetime_mode4, @run_datetime_mode2, @table_name = @table_name output;

if (@table_name is not null)
begin
	declare @database_name nvarchar(255);
	select @database_name = (case when len(@table_name)-len(replace(@table_name,'.','')) >= 2 then left(@table_name,CHARINDEX('.',@table_name)-1) else DB_NAME() end);
	set quoted_identifier off;
	set @sql = "
	use "+@database_name+";
	;WITH StatsOnTable AS (
		SELECT	sp.stats_id, st.name as stats_name, filter_definition, last_updated, rows, rows_sampled, steps, unfiltered_rows, 
				modification_counter, [stats_columns] = LTRIM(RTRIM([stats_columns])), [object_id] = st.object_id,
				[leading_stats_col] = case when charindex(',',c.stats_columns) > 0 
										then left(c.stats_columns,charindex(',',c.stats_columns)-1)
										else c.stats_columns end
		FROM sys.stats AS st
			 CROSS APPLY sys.dm_db_stats_properties(st.object_id, st.stats_id) AS sp
			 OUTER APPLY (	SELECT STUFF((SELECT  ', ' + c.name
							FROM  sys.stats_columns as sc
								left join sys.columns as c on sc.object_id = c.object_id AND c.column_id = sc.column_id  
							WHERE sc.object_id = st.object_id and sc.stats_id = st.stats_id
							ORDER BY sc.stats_column_id
							FOR XML PATH('')), 1, 1, '') AS [stats_columns]            
				) c
		WHERE st.object_id = OBJECT_ID(@table_name)
	)
	SELECT stats_id, Stats_Name, filter_definition, last_updated, rows, rows_sampled, steps, unfiltered_rows, modification_counter,
			[stats_columns], 
			[!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ tsql-Histogram ~~~~~~~~~~~~~~~~~~~~~~~~~~!] = 'USE "+@database_name+"; select stats_col = '''+ltrim(rtrim([leading_stats_col]))+''', * from '+QUOTENAME(DB_NAME())+'.sys.dm_db_stats_histogram ('+convert(varchar,[object_id])+', '+convert(varchar,stats_id)+') h;'
			,[--tsql-SHOW_STATISTICS--] = 'dbcc show_statistics ('''+(@table_name collate SQL_Latin1_General_CP1_CI_AS)+''','+stats_name+')'
	FROM StatsOnTable sts ORDER BY [stats_columns];
	"
	set quoted_identifier on;
	print @sql
	exec sp_ExecuteSql @sql, N'@table_name varchar(255), @database_name varchar(255)', @table_name, @database_name;
end

exec (@more_info_filter)
go


-- SELECT distinct run_datetime from dbo.BlitzIndex_Mode0 where run_datetime >= dateadd(day,-7,getdate())
-- SELECT distinct run_datetime from dbo.BlitzIndex where run_datetime >= dateadd(day,-7,getdate())
-- SELECT distinct run_datetime from dbo.BlitzIndex_Mode4 where run_datetime >= dateadd(day,-7,getdate())