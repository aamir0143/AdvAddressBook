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
