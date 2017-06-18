create database WatchBusinessOnline
go
use WatchBusinessOnline
go

-- Tạo bảng danh mục đồng hồ Categories
create table Categories (
	CategoryId int identity (1, 1) primary key,
	Name varchar(20) not null
)
go
-- Tạo bảng Watchs
create table Watchs (
	WatchId int identity (1, 1) primary key,
	CategoryId int,
	UnitPrice money,
	Quantity int,
	Image varchar(10),
	Description nvarchar(100)
)
go
alter table Watchs add Name varchar(30)
go

-- Tạo bảng Invoice_Details
create table Invoice_Details (
	Invoice_DetailId int identity (1, 1) primary key,
	WatchId int,
	InvoiceId int,
	Quantity int
)
go

-- Tạo bảng Invoices
create table Invoices (
	InvoiceId int identity (1, 1) primary key,
	Username varchar(20),
	NgayThanhLap datetime,
	NgayGiaoHang datetime,
	DiaDiemGiao nvarchar(50),
	ShipFee money,
	Status bit
)
go

-- Tạo bảng Customers
create table Customers (
	Username varchar(20) primary key,
	Name nvarchar(30),
	Password varchar(16),
	Email varchar(40),
	Address nvarchar(50),
	Phone varchar(11)
)
go
-- Tạo bảng Admins
create table Admins (
	Username varchar(20) primary key,
	Password varchar(16),
	Name nvarchar(30),
	Email varchar(40),
	Phone varchar(11)
)
go
-- Tạo khóa ngoại

Alter table Watchs Add Constraint Watch_Category_fk Foreign key(CategoryId) References Categories(CategoryId)

Alter table Invoice_Details Add constraint Details_Watch_fk Foreign key(WatchId) references Watchs(WatchId)

Alter table Invoice_Details Add constraint Details_Invoice foreign key(InvoiceId) references Invoices(InvoiceId)

Alter table Invoices Add constraint Invoices_Customers_fk foreign key(Username) references Customers(Username)
go
-- Chèn dữ liệu cho bảng Categories
insert into Category(Name) values('Casio')
insert into Category(Name) values('Rolex')
insert into Category(Name) values('Omega')
go
select * from Category
go
-- Chèn dữ liệu cho bảng Watchs
insert into Watch(CategoryId, Price, Quantity, Image, Name) values(1, 1200000, 30, 'casio1.jpg', 'Casio AE-00WD');
insert into Watch(CategoryId, Price, Quantity, Image, Name) values(1, 1300000, 30, 'casio2.jpg', 'Casio AE-210W');
insert into Watch(CategoryId, Price, Quantity, Image, Name) values(1, 1800000, 30, 'casio3.jpg', 'Casio AE-200W');
insert into Watch(CategoryId, Price, Quantity, Image, Name) values(1, 1250000, 30, 'casio4.jpg', 'Casio EQ-10BW');
insert into Watch(CategoryId, Price, Quantity, Image, Name) values(1, 1290000, 30, 'casio5.jpg', 'Casio EQ-100W');
insert into Watch(CategoryId, Price, Quantity, Image, Name) values(1, 2200000, 30, 'casio6.jpg', 'Casio AEQ-10W');
insert into Watch(CategoryId, Price, Quantity, Image, Name) values(1, 1200000, 30, 'casio7.jpg', 'Casio BEL-10D');
insert into Watch(CategoryId, Price, Quantity, Image, Name) values(2, 3500000, 25, 'rolex1.jpg', 'OYSTER PERPETUAL');
insert into Watch(CategoryId, Price, Quantity, Image, Name) values(2, 3600000, 25, 'rolex2.jpg', 'LADY-DATEJUST');
insert into Watch(CategoryId, Price, Quantity, Image, Name) values(2, 3700000, 25, 'rolex3.jpg', 'PEARLMASTER');
insert into Watch(CategoryId, Price, Quantity, Image, Name) values(2, 3800000, 25, 'rolex4.jpg', 'GMT-MASTER II');
insert into Watch(CategoryId, Price, Quantity, Image, Name) values(3, 3820000, 15, 'omega1.jpg', 'SPEEDMASTER OMEGA');
insert into Watch(CategoryId, Price, Quantity, Image, Name) values(3, 3220000, 15, 'omega2.jpg', 'HOUR VISION OMEGA');
insert into Watch(CategoryId, Price, Quantity, Image, Name) values(3, 3520000, 15, 'omega3.jpg', 'AQUA15 MASTER');
go

select * from Watch
go
-- Chèn dữ liệu cho bảng Customers
insert into User(Username, Name, Password, Email, Role) 
values('chinguyenle', 'Lê Chí Nguyên', '123456', 'endlesslovefor123@gmail.com', 'ADMIN');

insert into User(Username, Name, Password, Email, Role) 
values('chipunguyen', 'Nguyễn Chi Pu', '123456', 'xspacechinguyen@gmail.com', 'CUSTOMER');

insert into User(Username, Name, Password, Email, Role) 
values('sotungnguyen', 'Nguyễn Sơn Tùng', '123456', 'cristineronaldo@gmail.com', 'CUSTOMER');
go
select * from User




