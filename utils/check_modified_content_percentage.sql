SELECT CAST(ROUND((SUM(modified_extent_page_count)*100.0)/SUM(allocated_extent_page_count),2) as decimal(10,2)) 
FROM test_db.sys.dm_db_file_space_usage
