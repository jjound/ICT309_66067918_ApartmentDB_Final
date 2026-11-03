USE ApartmentDB;
GO

CREATE OR ALTER TRIGGER trg_CheckAndSetRoomOccupied
ON Contract
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1 
        FROM inserted i
        JOIN Room r ON i.RoomID = r.RoomID
        WHERE r.Status <> 'Available' AND i.Status = 'Active'
    )
    BEGIN
        RAISERROR (N'ข้อผิดพลาด: ห้องนี้มีผู้เช่าอยู่แล้วหรือไม่พร้อมให้เช่า ไม่สามารถทำสัญญาได้', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;

    UPDATE Room
    SET Status = 'Occupied'
    FROM Room r
    JOIN inserted i ON r.RoomID = i.RoomID
    WHERE i.Status = 'Active';
END;
GO