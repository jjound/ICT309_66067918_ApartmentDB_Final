# Apartment Management System (ApartmentDB)
**Course:** ICT309 Database Systems  
**Student ID:** 66067918  
**Developer:** Jetsadaporn Intaso  

---

##  Project Overview
ระบบฐานข้อมูลสำหรับการบริหารจัดการหอพัก (Apartment Management System) ออกแบบโครงสร้างรองรับการจัดเก็บข้อมูลห้องพัก ผู้เช่า สัญญาเช่า การจดบันทึกมิเตอร์น้ำ-ไฟ การออกใบแจ้งหนี้ และการชำระเงินอย่างเป็นระบบ

##  Deliverables & File Structure
* `66067918_jetsadaporn_01_create_schema.sql` - โครงสร้างตาราง Primary Key, Foreign Key และ Check Constraints
* `66067918_jetsadaporn_02_seed_data.sql` - ข้อมูลจำลอง Master Data และ Transactions
* `66067918_jetsadaporn_03_procedures.sql` - Stored Procedures สำหรับกระบวนการออกบิลและรับชำระเงิน
* `66067918_jetsadaporn_04_triggers.sql` - Triggers อัปเดตสถานะห้องพักอัตโนมัติตามสัญญา
* `66067918_jetsadaporn_05_security_roles.sql` - การกำหนดสิทธิ์ผู้ใช้ (StaffRole & ManagerRole)
* `66067918_jetsadaporn_06_test_cases.sql` - สคริปต์ชุดทดสอบเงื่อนไขและการทำงาน
* `66067918_jetsadaporn_ApartmentDB.bak` - ไฟล์ Database Backup สำหรับนำไป Restore บน SQL Server
