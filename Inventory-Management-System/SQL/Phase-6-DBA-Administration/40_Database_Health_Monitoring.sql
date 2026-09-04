SELECT
    name AS DatabaseName,
    state_desc AS DatabaseStatus,
    recovery_model_desc AS RecoveryModel,
    compatibility_level AS CompatibilityLevel
FROM sys.databases
ORDER BY name;
GO

---Check database sizes

SELECT
    DB_NAME(database_id) AS DatabaseName,
    type_desc AS FileType,
    name AS LogicalFileName,
    physical_name AS PhysicalFileLocation,
    CAST(size * 8.0 / 1024 AS DECIMAL(10,2)) AS SizeMB
FROM sys.master_files
ORDER BY DatabaseName, FileType;
GO


----Check last backups

SELECT
    d.name AS DatabaseName,
    MAX(CASE
        WHEN bs.type = 'D'
        THEN bs.backup_finish_date
    END) AS LastFullBackup,

    MAX(CASE
        WHEN bs.type = 'I'
        THEN bs.backup_finish_date
    END) AS LastDifferentialBackup,

    MAX(CASE
        WHEN bs.type = 'L'
        THEN bs.backup_finish_date
    END) AS LastLogBackup

FROM sys.databases AS d

LEFT JOIN msdb.dbo.backupset AS bs
    ON d.name = bs.database_name

GROUP BY d.name
ORDER BY d.name;
GO