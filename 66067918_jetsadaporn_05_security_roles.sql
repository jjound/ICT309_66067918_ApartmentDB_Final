USE ApartmentDB;
GO

IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = 'StaffRole' AND type = 'R')
    CREATE ROLE StaffRole; 

IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = 'ManagerRole' AND type = 'R')
    CREATE ROLE ManagerRole;
GO

GRANT SELECT ON Building TO StaffRole;
GRANT SELECT ON Room TO StaffRole;
GRANT SELECT ON Tenant TO StaffRole;
GRANT SELECT ON Contract TO StaffRole;
GRANT SELECT ON UtilityRate TO StaffRole;

GRANT SELECT, INSERT, UPDATE ON MeterReading TO StaffRole;
GRANT SELECT, INSERT, UPDATE ON Invoice TO StaffRole;
GRANT SELECT, INSERT, UPDATE ON Payment TO StaffRole;

GRANT EXECUTE ON sp_GenerateMonthlyInvoice TO StaffRole;
GRANT EXECUTE ON sp_RecordPayment TO StaffRole;

DENY DELETE ON Contract TO StaffRole;
DENY INSERT, UPDATE, DELETE ON UtilityRate TO StaffRole;
GO

GRANT SELECT, INSERT, UPDATE, DELETE ON Building TO ManagerRole;
GRANT SELECT, INSERT, UPDATE, DELETE ON Room TO ManagerRole;
GRANT SELECT, INSERT, UPDATE, DELETE ON Tenant TO ManagerRole;
GRANT SELECT, INSERT, UPDATE, DELETE ON Contract TO ManagerRole;
GRANT SELECT, INSERT, UPDATE, DELETE ON UtilityRate TO ManagerRole;
GRANT SELECT, INSERT, UPDATE, DELETE ON MeterReading TO ManagerRole;
GRANT SELECT, INSERT, UPDATE, DELETE ON Invoice TO ManagerRole;
GRANT SELECT, INSERT, UPDATE, DELETE ON Payment TO ManagerRole;

GRANT EXECUTE TO ManagerRole;
GO