EXEC sp_msforeachdb "
IF '?' not in ('tempdb')
begin
    exec ('ALTER DATABASE [?] SET RECOVERY FULL;')
    print '?'
end
"
;
