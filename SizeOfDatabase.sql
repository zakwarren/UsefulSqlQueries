-- Find the size of the databases in the current server
with fs as (
    select	 database_id
			,type
			,size * 8.0 / 1024 as size
    from sys.master_files
)
select	 Name
		,cast(	(	select sum(size)
                    from fs
                    where type = 0
                        and fs.database_id = db.database_id)
            as float) as DataFileSizeMB
		,cast(	(	select sum(size)
                    from fs
                    where type = 1
                        and fs.database_id = db.database_id)
            as float) LogFileSizeMB
from sys.databases db;


-- Alternate method of finding size of a database including size on disk
select	 fg.data_space_id as FGID
		,f.file_id as File_Id
		,cast(f.size as float) * 8.00 * 1024 as Size_On_Disk_Bytes
		,round(	(cast(f.size as float) * 8.00 / 1024) / 1024, 3	) as Actual_File_Size
		,round(	cast(f.size as float) / 128, 2	) as Reserved_MB
		,round(	cast(fileproperty(f.name, 'SpaceUsed') as float) / 128, 2	) as Used_MB
		,round(	(cast(f.size as float) / 128) - (cast(fileproperty(f.name, 'SpaceUsed') as float) / 128), 2	) as Free_MB
		,f.name
		,f.physical_name
from sys.database_files f
    left join sys.filegroups fg on f.data_space_id = fg.data_space_id;