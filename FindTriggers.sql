-- Find all triggers in the current database
select	 sysobjects.name as TriggerName
		,user_name(sysobjects.uid) as TriggerOwner
		,s.name as TableSchema
		,object_name(parent_obj) as TableName
		,objectproperty(id, 'ExecIsUpdateTrigger') as IsUpdate
		,objectproperty(id, 'ExecIsDeleteTrigger') as IsDelete
		,objectproperty(id, 'ExecIsInsertTrigger') as IsInsert
		,objectproperty(id, 'ExecIsAfterTrigger') as IsAfter
		,objectproperty(id, 'ExecIsInsteadOfTrigger') as IsInsteadOf
		,objectproperty(id, 'ExecIsTriggerDisabled') as IsDisabled
from sysobjects
	inner join sysusers on sysobjects.uid = sysusers.uid
	inner join sys.tables t on sysobjects.parent_obj = t.object_id
	inner join sys.schemas s on t.schema_id = s.schema_id
where sysobjects.type = 'TR';