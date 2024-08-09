SELECT
	name AS 'DatabaseName', 
	total_vlf_count AS 'VLFcount' ,
	log_since_last_log_backup_mb,
	recovery_model_desc
FROM 
	sys.databases AS s
	CROSS APPLY sys.dm_db_log_stats(s.database_id) 
where  
	s.state_Desc='ONLINE'
