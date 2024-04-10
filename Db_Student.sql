create database ThanhGiang_BaiTap_EF
go
use ThanhGiang_BaiTap_EF
go
create table Faculty
(
	FacultyId VARCHAR(3) NOT NULL PRIMARY KEY,
	FacultyName NVARCHAR(200)
)
go
create table Student
(
	StudentId  VARCHAR(15) not null PRIMARY KEY,	
    StudentName NVARCHAR(100),
    Gender DATE,
    Address NVARCHAR(Max),
	FacultyId VARCHAR(3) FOREIGN KEY REFERENCES Faculty(FacultyId)
    on update
		cascade
	on delete
		cascade
)
go
insert Faculty(FacultyId,FacultyName)
values
	('1',N'Công Ngh? S?'),
	('2',N'C? Khí'),
	('3',N'?i?n - ?i?n T?')

go
insert Student(StudentId,StudentName,Gender,Address,FacultyId)
values
	('21115053120114',N'?oàn Nguy?n Thành Giang','2003-02-27',N'Qu?ng Nam','1'),
	('21115053120115',N'Nguy?n V?n A','2002-02-27',N'Qu?ng Nam','1'),
	('21115053120116',N'?inh V?n B','2004-04-27',N'Qu?ng Nam','1'),
	('21115053120117',N'Tr?n Th? C','2005-06-22',N'Qu?ng Nam','1'),
	('21115053120118',N'?? V?n N','2003-02-22',N'Qu?ng Nam','2'),
	('21115053120119',N'Cao V?n H','2003-02-07',N'Qu?ng Nam','2'),
	('21115053120120',N'Lê Th? T','2003-02-22',N'Qu?ng Nam','3')

Alter table Student
	alter column Gender Date not null