create database online_book_publishing_sales_platform;

use online_book_publishing_sales_platform;

create table publisher(
  PublisherID int primary key,
  name varchar(100) not null,
  ContactDetails varchar(255)
  );
  
CREATE TABLE Book(
	BookID INT PRIMARY KEY,
    Title VARCHAR(200) NOT NULL,
    ISBN VARCHAR(20) NOT NULL,
    Edition INT NOT NULL,
    PublisherID INT,
    FOREIGN KEY (PublisherID) REFERENCES Publisher(PublisherID)
);

CREATE TABLE Genre (
GenreID INT PRIMARY KEY,
GenreName VARCHAR(100) NOT NULL
);

CREATE TABLE BookGenre (
BookID INT,
GenreID INT,

PRIMARY KEY (BookID, GenreID),

FOREIGN KEY (BookID) REFERENCES Book (BookID),

FOREIGN KEY (GenreID) REFERENCES Genre (GenreID)
);


CREATE TABLE Author (

AuthorID INT PRIMARY KEY,

Name VARCHAR(100) NOT NULL,

Biography TEXT

);

CREATE TABLE BookAuthor (

BookID INT,

AuthorID INT,

PRIMARY KEY (BookID,AuthorID),

FOREIGN KEY (BookID) REFERENCES Book (BookID),

FOREIGN KEY (AuthorID) REFERENCES Author (AuthorID)

);
CREATE TABLE Customer ( CustomerID INT PRIMARY KEY, Name VARCHAR(100) NOT NULL  );

CREATE TABLE Address (

AddressID INT PRIMARY KEY,

CustomerID INT,

Street VARCHAR(100),

City VARCHAR(100),

State VARCHAR(100),

Country VARCHAR(100),

FOREIGN KEY (CustomerID) REFERENCES Customer (CustomerID)

);
CREATE TABLE Wishlist (

CustomerID INT,

BookID INT,

PRIMARY KEY (CustomerID, BookID),

FOREIGN KEY (CustomerID) REFERENCES Customer (CustomerID),

FOREIGN KEY (BookID) REFERENCES Book (BookID)


);
CREATE TABLE Orderr (

OrderID INT PRIMARY KEY,

OrderDate DATE NOT NULL,

CustomerID INT,

PaymentDetails VARCHAR(255),

ShipmentStatus VARCHAR(50),

ShippingAddressID INT,

FOREIGN KEY (CustomerID) REFERENCES Customer (CustomerID),

FOREIGN KEY (ShippingAddressID) REFERENCES Address (AddressID)
);

CREATE TABLE Order_Book (

OrderItemID INT PRIMARY KEY,

OrderID INT,

BookID INT,

Quantity INT NOT NULL,
ItemDiscount DECIMAL (5,2),

FOREIGN KEY (OrderID) REFERENCES Orderr (OrderID),

FOREIGN KEY (BookID) REFERENCES Book (BookID)

);

INSERT INTO Publisher (PublisherID, name, ContactDetails) VALUES
(1, 'Pearson Publishing', 'contact@pearson.com'),
(2, 'O\'Reilly Media', 'info@oreilly.com'),
(3, 'Penguin Random House', 'support@penguinrandom.com');

INSERT INTO Book (BookID, Title, ISBN, Edition, PublisherID) VALUES
(101, 'Learning SQL', '9780596520830', 2, 2),
(102, 'Effective Java', '9780134685991', 3, 1),
(103, 'The Catcher in the Rye', '9780316769488', 1, 3);

INSERT INTO Genre (GenreID, GenreName) VALUES
(1, 'Technology'),
(2, 'Programming'),
(3, 'Fiction'),
(4, 'Classic Literature');

INSERT INTO BookGenre (BookID, GenreID) VALUES
(101, 1),
(101, 2),
(102, 2),
(103, 3),
(103, 4);

INSERT INTO Author (AuthorID, Name, Biography) VALUES
(1, 'Alan Beaulieu', 'Author of Learning SQL.'),
(2, 'Joshua Bloch', 'Former Google engineer, author of Effective Java.'),
(3, 'J.D. Salinger', 'American writer known for The Catcher in the Rye.');

INSERT INTO BookAuthor (BookID, AuthorID) VALUES
(101, 1),
(102, 2),
(103, 3);

INSERT INTO Customer (CustomerID, Name) VALUES
(1, 'Alice Johnson'),
(2, 'Bob Smith');

INSERT INTO Address (AddressID, CustomerID, Street, City, State, Country) VALUES
(1, 1, '123 Main St', 'New York', 'NY', 'USA'),
(2, 2, '456 Elm St', 'San Francisco', 'CA', 'USA');

INSERT INTO Wishlist (CustomerID, BookID) VALUES
(1, 101),
(1, 103),
(2, 102);

INSERT INTO Orderr (OrderID, OrderDate, CustomerID, PaymentDetails, ShipmentStatus, ShippingAddressID) VALUES
(201, '2025-06-01', 1, 'VISA ****1234', 'Shipped', 1),
(202, '2025-06-05', 2, 'PayPal', 'Processing', 2);

INSERT INTO Order_Book (OrderItemID, OrderID, BookID, Quantity, ItemDiscount) VALUES
(1, 201, 101, 1, 0.00),
(2, 201, 103, 2, 5.00),
(3, 202, 102, 1, 2.50);









