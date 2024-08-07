  USE [master]
  ALTER DATABASE test_db SET SINGLE_USER
  WITH ROLLBACK IMMEDIATE;

-- Assume the database is lost at this point. Now restore the full   
-- database. Specify the original full database backup and NORECOVERY.  
-- NORECOVERY allows subsequent restore operations to proceed.
RESTORE DATABASE test_db  
 FROM  DISK = N'C:\MSSQL_Backups\test_db_20240806_Full.bak'  
 WITH NORECOVERY,
      REPLACE,
  STATS=10;  
GO  

-- Now restore the differential database backup, the second backup on   
-- the MyAdvWorks_1 backup device.  
RESTORE DATABASE test_db  
   FROM DISK =  N'C:\MSSQL_Backups\test_db_20240806_Diff.bak'  
   WITH FILE = 1,  
   NORECOVERY;  
GO  

-- Now restore each transaction log backup created after  
-- the differential database backup.  
RESTORE LOG test_db  
   FROM DISK = N'C:\MSSQL_Backups\test_db_20240807_log.bak'
   WITH RECOVERY;  
GO  


ALTER DATABASE test_db SET MULTI_USER;
