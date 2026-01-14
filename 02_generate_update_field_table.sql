# --- set paramater
set @TABLE_SCHEMA = 'wms_db_source_name';
set @fmorganizationId = 'ORG_SOURCE';
set @toorganizationId = 'ORG_DESTINATION';
# -- generate update SQL staetements to update organizationId
select concat('UPDATE ', a.TABLE_NAME , ' set organizationId = ''', @toorganizationId , ''' where organizationId = ''', @fmorganizationId, ''';' )
from information_schema.TABLES a
inner join information_schema.`COLUMNS` b on a.TABLE_NAME  = b.TABLE_NAME and a.TABLE_SCHEMA  = b.TABLE_SCHEMA
where b.TABLE_SCHEMA =@TABLE_SCHEMA and b.COLUMN_NAME = 'organizationId' and a.table_type = 'BASE TABLE'
