CREATE TABLE Category (
    CategoryID VARCHAR(8) PRIMARY KEY,
    CategoryName VARCHAR(50) NOT NULL UNIQUE
);
CREATE TABLE Products (
    ProductID VARCHAR(8) PRIMARY KEY,
    CategoryID VARCHAR(10) NOT NULL,
    ProductName VARCHAR(100) NOT NULL,
    Price DECIMAL(10, 2) CHECK (Price > 0),
    QuantityInStock INT CHECK (QuantityInStock >= 0),
    DateAdded DATE NOT NULL,
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);
CREATE TABLE Customers (
    CustomerID VARCHAR(8) PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    BirthDate DATE,
    Email VARCHAR(100) NOT NULL UNIQUE,
    PhoneNo VARCHAR(15) NOT NULL UNIQUE,
    CreationDate DATE NOT NULL,
    HouseNo VARCHAR(10),
    Street VARCHAR(100),
    PostalCode VARCHAR(10),
    City VARCHAR(50)
);

CREATE TABLE Orders (
    OrderID VARCHAR(8) PRIMARY KEY,
    CustomerID VARCHAR(8) NOT NULL,
    OrderDate DATE NOT NULL,
    OrderStatus VARCHAR(20) NOT NULL CHECK (OrderStatus IN ('Processing', 'Shipped', 'Delivered', 'Cancelled', 'Returned')),
    TotalCost DECIMAL(10, 2) CHECK (TotalCost >= 0),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
CREATE TABLE OrderLine (
    OrderID VARCHAR(8),
    ProductID VARCHAR(8),
    QuantityOrder INT CHECK (QuantityOrder > 0),
    Subtotal DECIMAL(10, 2) CHECK (Subtotal >= 0),
    PRIMARY KEY (OrderID, ProductID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
CREATE TABLE Supplier (
    SupplierID VARCHAR(8) PRIMARY KEY,
    SupplierName VARCHAR(100) NOT NULL UNIQUE,
    EmailAddr VARCHAR(100) NOT NULL UNIQUE,
    PhoneNo VARCHAR(15) NOT NULL UNIQUE
);
CREATE TABLE PurchaseOrder (
    PurchaseOrderID VARCHAR(8) PRIMARY KEY,
    SupplierID VARCHAR(8) NOT NULL,
    OrderDate DATE NOT NULL,
    OrderStatus VARCHAR(20) NOT NULL CHECK (OrderStatus IN ('Pending', 'Completed', 'Shipped', 'Cancelled')),
    TotalCost DECIMAL(10, 2) CHECK (TotalCost >= 0),
    FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID)
);
CREATE TABLE PurchaseOrderLine (
    PurchaseOrderLineID VARCHAR(8) PRIMARY KEY,
    ProductID VARCHAR(8) NOT NULL,
    PurchaseOrderID VARCHAR(8) NOT NULL,
    Cost DECIMAL(10, 2) CHECK (Cost >= 0),
    Quantity INT CHECK (Quantity > 0),
    Subtotal DECIMAL(10, 2) CHECK (Subtotal >= 0),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (PurchaseOrderID) REFERENCES PurchaseOrder(PurchaseOrderID)
);
CREATE TABLE Paymentinfo (
    PaymentID VARCHAR(8) PRIMARY KEY,
    OrderID VARCHAR(8) NOT NULL,
    CardNo VARCHAR(16) NOT NULL CHECK (LENGTH(CardNo) = 16),
    CardCVC VARCHAR(3) NOT NULL CHECK (LENGTH(CardCVC) = 3),
    CardExpirationMonth INT CHECK (CardExpirationMonth BETWEEN 1 AND 12),
    CardExpirationYear INT CHECK (CardExpirationYear >= 2024),
    PaymentType VARCHAR(20) NOT NULL,
    DateOfPayment DATE NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);





