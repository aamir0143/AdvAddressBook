---------------------------------Creating The Database AddressBook(UC1)----------------------------------
Create Database AddressBookDB;
Use AddressBookDB;
---------------------------------Creating The AddressBook Table (UC2)------------------------------------
Create Table AddressBook(
	FirstName varchar(50) not null,
	LastName varchar(50),
	Address varchar(255),
	City varchar(50),
	StateName varchar(50),
	ZipCode int,
	PhoneNum bigint,
	EmailId varchar(50)
);
---------------------------------------Inserting Value Into The AddressBook Table (UC3)-----------------------------------------------
Insert Into AddressBook Values('Aamir', 'Reza', 'Dubaili', 'Purnea', 'Bihar', 854330, 7975633784, 'aamirreza156@gmail.com'),
						('Wasim', 'Anwar', 'Modhipur', 'Purnea', 'Bihar', 854330, 9199523544, 'abc456@gmail.com'),	
						('Arjun', 'Jaiswal', 'Shamastipur', 'Muzaffarpur', 'Bihar', 854315, 7412589631, 'abc789@gmail.com'),	
						('Rakesh', 'Kumar', 'Kasba', 'Purnea', 'Bihar', 854330, 9852364170, 'abc852@gmail.com'),	
						('Anwar', 'Alam', 'Purnea', 'Purnea', 'Bihar', 854330, 9852741630, 'abc741@gmail.com');
Select * From AddressBook;
---------------------------------------Edit Existing AddressBook Table Using Update(UC4)-----------------------------------------------
Update AddressBook Set EmailId='mansi@yahoo.com' Where FirstName='Wasim';
Update AddressBook Set Address='Gandhinagar', City = 'Patna', StateName = 'Bihar' Where FirstName='Aamir';
Update AddressBook Set Phonenum=7415986320 Where FirstName='Rakesh';
Update AddressBook Set LastName='Kumar' Where FirstName='Arjun';
Select * From AddressBook;
---------------------------------------Delete Existing Contact From Table(UC5)-----------------------------------------------
Delete From AddressBook Where FirstName='Anwar' And LastName = 'Alam';
Select * From AddressBook;
--------------------------------Retrieve Person Record From Table By City Or State(UC6)---------------------------------------
Select * From AddressBook Where City='Purnea' Or StateName='Bihar';
----------------------Ability To Get The Size Of AddressBook By City And State Using Count(UC7)---------------------------------
Select Count(*) As Count,StateName,City From AddressBook Group By StateName,City;
--------------------------------------Retrive Sorted Persons Records By City(UC8)------------------------------------------------
Select * From AddressBook Where City = 'Purnea' Order By FirstName;
-----------------------------------------------Add AddressBookName And Type Column(UC9)----------------------------------------------------------
Alter Table AddressBook Add AddressBookName varchar(50), AddressBookType varchar(50);

Insert Into AddressBook(FirstName,LastName,Address,City,StateName,ZipCode,PhoneNum,EmailId) 
					Values('Ashraf', 'Pasha', 'Gandhinagar', 'Bengluru', 'Karnataka', 560045, 9823434561, 'abc012@gmail.com'),
						('Mahesh', 'Babu', 'Manglore', 'Bengluru', 'Karnataka', 560030, 7419632580, 'abc320@gmail.com'),	
						('Aftab', 'Alam', 'Noida', 'Delhi', 'NewDelhi', 965874, 7412589631, 'abc475@gmail.com'),	
						('Afroz', 'Alam', 'Silampur', 'Delhi', 'NewDelhi', 965875, 9874561230, 'abc456@gmail.com'),	
						('Bhrat', 'Kumar', 'Yalanka', 'Bengluru', 'Karnataka', 560015, 7456981230, 'abc786@gmail.com');
------------------Updating The DataBase With New Coulmn Values
Update AddressBook Set AddressBookName='FreindsAddressBook',AddressBookType='Freinds' Where FirstName ='Ashraf' Or FirstName='Wasim' Or FirstName = 'Mahesh';
Update AddressBook Set AddressBookName='FamilyAddressBook',AddressBookType='Family' Where FirstName ='Aamir' Or FirstName='Aftab' Or FirstName = 'Afroz';
Update AddressBook Set AddressBookName='ProfesionAddressBook',AddressBookType='Profession' Where FirstName ='Arjun' Or FirstName='Bhrat' Or FirstName = 'Rakesh';
Select * From AddressBook Order By FirstName;
-----------------------------Ability To Get Number Of Contact Persons i.e. Count By Type And Name(UC10)-----------------------------
Select Count(*) As CountABType,AddressBookType From AddressBook Group By AddressBookType;
Select Count(*) As CountABNames,AddressBookName  From AddressBook Group By AddressBookName;	
-----------------------------Adding Same Person In Different AddressBookType(UC11)-----------------------------
Insert into AddressBook values ('Wasim', 'Anwar', 'Modhipur', 'Purnea', 'Bihar', 854330, 9199523544, 'abc456@gmail.com','FamilyAddressBook','Family');
Select * From AddressBook Order By FirstName;
--------------------------------------------Creating Tables Using ER Diagram(UC12)--------------------------------------------------
Create Table Address_Book(
	AddressBookId Int Identity(1,1) Primary Key,
	AddressBookName varchar(50)
);
Create Table Persons_Details(
	PersonId Int Identity(1,1) Primary Key,
	AddressBookId Int Foreign Key References Address_Book(AddressBookId),
	FirstName varchar(50),
	LastName varchar(50),
	Address varchar(255),
	City varchar(50),
	StateName varchar(50),
	ZipCode int,
	PhoneNum bigint,
	EmailId varchar(50)
);
CREATE TABLE Person_Types(
	PersonTypeId Int Identity(1,1) Primary Key,
	PersonType varchar(50),
);
CREATE TABLE Persons_Details_Type(
	PersonId Int Foreign Key References Persons_Details(PersonId),
	PersonTypeId Int Foreign Key References Person_Types(PersonTypeId)
);
Insert Into Address_Book Values ('Home'),('Office'),('College');
Select * From Address_Book;
Insert Into Person_Types Values ('Family'),('Profession'),('Freinds');
Select * From Person_Types;
Insert Into Persons_Details Values(1,'Aamir', 'Reza', 'Dubaili', 'Purnea', 'Bihar', 854330, 7975633784, 'aamirreza156@gmail.com'),
						(3,'Mahesh', 'Babu', 'Manglore', 'Bengluru', 'Karnataka', 560030, 7419632580, 'abc320@gmail.com'),	
						(3,'Rakesh', 'Kumar', 'Kasba', 'Purnea', 'Bihar', 854330, 9852364170, 'abc852@gmail.com'),	
						(3,'Ashraf', 'Pasha', 'Gandhinagar', 'Bengluru', 'Karnataka', 560045, 9823434561, 'abc012@gmail.com'),
						(2,'Aftab', 'Alam', 'Noida', 'Delhi', 'NewDelhi', 965874, 7412589631, 'abc475@gmail.com'),
						(2,'Afroz', 'Alam', 'Silampur', 'Delhi', 'NewDelhi', 965875, 9874561230, 'abc456@gmail.com'),	
						(2,'Bhrat', 'Kumar', 'Yalanka', 'Bengluru', 'Karnataka', 560015, 7456981230, 'abc786@gmail.com'),	
						(1,'Anwar', 'Alam', 'Purnea', 'Purnea', 'Bihar', 854330, 9852741630, 'abc741@gmail.com'),	
						(1,'Wasim', 'Anwar', 'Modhipur', 'Purnea', 'Bihar', 854330, 9199523544, 'abc456@gmail.com');
Select * From Persons_Details;
Insert Into Persons_Details_Type VALUES (1,1),(2,3),(3,3),(4,3),(5,2),(6,2),(7,2),(8,1),(9,1);
SELECT * FROM Persons_Details_Type;