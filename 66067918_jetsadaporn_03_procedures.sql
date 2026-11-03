USE ApartmentDB;
GO

CREATE OR ALTER PROCEDURE sp_GenerateMonthlyInvoice
    @Month INT,
    @Year INT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        BEGIN TRANSACTION;

        DECLARE @ElecRate DECIMAL(6,2), @WaterRate DECIMAL(6,2), @MinWater DECIMAL(6,2);
        SELECT TOP 1 
            @ElecRate = ElectricityRate, 
            @WaterRate = WaterRate, 
            @MinWater = MinWaterCharge 
        FROM UtilityRate 
        ORDER BY EffectiveDate DESC;

        INSERT INTO Invoice (ContractID, InvoiceMonth, InvoiceYear, RentAmount, ElectricityAmount, WaterAmount, CommonFee, DueDate, Status)
        SELECT 
            c.ContractID,
            @Month,
            @Year,
            r.MonthlyRate AS RentAmount,
            ISNULL((m.CurrElectricity - m.PrevElectricity) * @ElecRate, 0.00) AS ElectricityAmount,
            CASE 
                WHEN ISNULL((m.CurrWater - m.PrevWater) * @WaterRate, 0.00) < @MinWater THEN @MinWater
                ELSE (m.CurrWater - m.PrevWater) * @WaterRate
            END AS WaterAmount,
            300.00 AS CommonFee, 
            DATEFROMPARTS(@Year, @Month, 5) AS DueDate,
            'Unpaid' AS Status
        FROM Contract c
        JOIN Room r ON c.RoomID = r.RoomID
        LEFT JOIN MeterReading m ON r.RoomID = m.RoomID AND m.ReadingMonth = @Month AND m.ReadingYear = @Year
        WHERE c.Status = 'Active'

          AND NOT EXISTS (
              SELECT 1 FROM Invoice inv 
              WHERE inv.ContractID = c.ContractID 
                AND inv.InvoiceMonth = @Month 
                AND inv.InvoiceYear = @Year
          );

        COMMIT TRANSACTION;
        PRINT 'Generate invoices completed successfully.';
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO

CREATE OR ALTER PROCEDURE sp_RecordPayment
    @InvoiceID INT,
    @AmountPaid DECIMAL(10,2),
    @PaymentMethod VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        BEGIN TRANSACTION;

       
        INSERT INTO Payment (InvoiceID, PaymentDate, AmountPaid, FineAmount, PaymentMethod)
        VALUES (@InvoiceID, GETDATE(), @AmountPaid, 0.00, @PaymentMethod);

        UPDATE Invoice
        SET Status = 'Paid'
        WHERE InvoiceID = @InvoiceID;

        COMMIT TRANSACTION;
        PRINT 'Payment recorded and invoice updated to Paid.';
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO