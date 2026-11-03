USE ApartmentDB;
GO

INSERT INTO Room (BuildingID, RoomNumber, RoomType, MonthlyRate, Status) VALUES
(1, 'A104', 'Standard', 4500.00, 'Occupied'),
(1, 'A201', 'Standard', 4500.00, 'Occupied'),
(1, 'A202', 'Standard', 4500.00, 'Occupied'),
(1, 'A203', 'Deluxe', 5500.00, 'Available'),
(1, 'A204', 'Deluxe', 5500.00, 'Occupied'),
(1, 'A301', 'Studio', 6500.00, 'Available'),
(1, 'A302', 'Studio', 6500.00, 'Occupied'),
(2, 'B102', 'Standard', 4500.00, 'Occupied'),
(2, 'B103', 'Standard', 4500.00, 'Occupied'),
(2, 'B104', 'Deluxe', 5500.00, 'Available'),
(2, 'B201', 'Deluxe', 5500.00, 'Occupied'),
(2, 'B202', 'Deluxe', 5500.00, 'Occupied'),
(2, 'B203', 'Studio', 6500.00, 'Occupied'),
(2, 'B204', 'Studio', 6500.00, 'Available'),
(2, 'B301', 'Studio', 6500.00, 'Occupied'),
(2, 'B302', 'Studio', 6500.00, 'Occupied');

INSERT INTO Tenant (FirstName, LastName, CitizenID, PhoneNumber, Email, EmergencyContact) VALUES
(N'ธีรเดช', N'วงศ์สวัสดิ์', '1100200111223', '0821112233', 'theeradej@email.com', '0819998877'),
(N'พิมพา', N'สุขประเสริฐ', '1100200222334', '0832223344', 'pimpa@email.com', '0828887766'),
(N'ณัฐวุฒิ', N'ศรีมงคล', '1100200333445', '0843334455', 'nuttawut@email.com', '0837776655'),
(N'วรรณิศา', N'มีทรัพย์', '1100200444556', '0854445566', 'wannisa@email.com', '0846665544'),
(N'ชานนท์', N'เกียรติขจร', '1100200555667', '0865556677', 'chanon@email.com', '0855554433'),
(N'อรอุมา', N'แก้วมณี', '1100200666778', '0876667788', 'onuma@email.com', '0864443322'),
(N'ธนพล', N'ทองดี', '1100200777889', '0887778899', 'tanapol@email.com', '0873332211'),
(N'ศิริพร', N'บุญส่ง', '1100200888990', '0898889900', 'siriporn@email.com', '0882221100');

INSERT INTO Contract (RoomID, TenantID, StartDate, EndDate, DepositAmount, Status) VALUES
(3, 3, '2026-03-01', '2027-02-28', 9000.00, 'Active'),
(4, 4, '2026-04-01', '2027-03-31', 9000.00, 'Active'),
(5, 5, '2026-05-01', '2027-04-30', 9000.00, 'Active'),
(7, 6, '2026-06-01', '2027-05-31', 11000.00, 'Active'),
(9, 7, '2026-07-01', '2027-06-30', 13000.00, 'Active'),
(10, 8, '2026-08-01', '2027-07-31', 9000.00, 'Active');

INSERT INTO MeterReading (RoomID, ReadingMonth, ReadingYear, PrevElectricity, CurrElectricity, PrevWater, CurrWater, ReadingDate) VALUES
(1, 8, 2026, 1000, 1110, 280, 290, '2026-08-31'),
(1, 9, 2026, 1110, 1200, 290, 300, '2026-09-30'),
(2, 8, 2026, 1980, 2060, 390, 400, '2026-08-31'),
(2, 9, 2026, 2060, 2150, 400, 410, '2026-09-30'),
(3, 10, 2026, 500, 580, 120, 128, '2026-10-31'),
(4, 10, 2026, 750, 840, 160, 172, '2026-10-31');

INSERT INTO Invoice (ContractID, InvoiceMonth, InvoiceYear, RentAmount, ElectricityAmount, WaterAmount, CommonFee, DueDate, Status) VALUES
(3, 10, 2026, 4500.00, 640.00, 144.00, 300.00, '2026-11-05', 'Paid'),
(4, 10, 2026, 4500.00, 720.00, 216.00, 300.00, '2026-11-05', 'Unpaid');

INSERT INTO Payment (InvoiceID, PaymentDate, AmountPaid, FineAmount, PaymentMethod) VALUES
(3, '2026-11-02 10:15:00', 5584.00, 0.00, 'PromptPay');
GO