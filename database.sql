create database if not exists BookStore;
use BookStore;

drop table if exists Categories;

CREATE TABLE IF NOT EXISTS Categories (
    categoryId INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255)
);

drop table if exists Clients;

CREATE TABLE Clients (
    clientId INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    phone VARCHAR(14),
    date_joined DATE
);

DROP TABLE IF EXISTS Suppliers;
CREATE TABLE Suppliers (
    supplierId INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255),
    email VARCHAR(255),
    phone VARCHAR(14),
    PRIMARY KEY (supplierId	)
);

DROP TABLE IF EXISTS Publishers;

CREATE TABLE Publishers (
    publisherId INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255),
    email VARCHAR(255),
    addres TEXT,
    PRIMARY KEY (publisherId)
);

DROP  TABLE IF EXISTS Employees;

CREATE TABLE Employees (
    employeeId INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255),
    mail VARCHAR(255),
    phone VARCHAR(14),
    national_id VARCHAR(40) NOT NULL,
    password VARCHAR(255),
    isAdmin BOOLEAN,
    salary float,
    primary key(employeeId)
);

DROP  TABLE IF EXISTS Books;

CREATE TABLE Books (
    bookId INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255),
    author VARCHAR(255),
    amount_inStock INT,
    price INT,
    description TEXT,
    categoryId int,
	publisherId int,
    primary key(bookId),
    constraint books_publisher_FK foreign key (publisherId) references Publishers(publisherId) ON UPDATE CASCADE ON DELETE set null,
    constraint books_category_fk foreign key (categoryId) references categories(categoryId)ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS Sales;

CREATE TABLE Sales (
    saleId INT NOT NULL AUTO_INCREMENT,
    saleTime DATETIME,
    quantity INT NOT NULL,
    clientId INT,
    bookName VARCHAR(255),
    price FLOAT,
    bookId int,
    employeeId int,
    primary key(saleId), 
	constraint Sales_Book_FK foreign key (bookId) references Books(bookId) ON UPDATE CASCADE ON DELETE set null 	 ,
    constraint Sales_CLient_FK foreign key (clientId) references Clients(clientId) ON UPDATE CASCADE ON DELETE set null 	 ,
    constraint Sales_Employee_FK foreign key (employeeId) references Employees(employeeId) ON UPDATE CASCADE ON DELETE set null
    
);

DROP TABLE IF EXISTS Requests;

CREATE TABLE Requests(
	requestId int not null auto_increment,
	requestTime datetime,
    quantity int,
    clientId int,
    book varchar(255),
    primary key(requestId),
    constraint REquest_CLient_FK foreign key (clientId) references Clients(clientId) ON UPDATE CASCADE ON DELETE set null 
);
