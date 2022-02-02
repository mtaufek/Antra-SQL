CREATE PROC sp_birthday_employees_Taufek  @first_name VARCHAR(20), @last_name VARCHAR(20) 
AS BEGIN DECLARE @SQLString NVARCHAR(MAX) 
SET @SQLString = 'CREATE TABLE  ' + 'birthday_employees_your_Taufek ' + 
'([id] [int] IDENTITY(1,1) NOT NULL, 
[firstname] [nvarchar] [20] NOT NULL, 
[firstname] [nvarchar] [20] NOT NULL)'
END