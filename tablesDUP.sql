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



INSERT INTO Category (CategoryID, CategoryName) VALUES
('CAT001', 'Monitors'),
('CAT002', 'Keyboard'),
('CAT003', 'Mouse'),
('CAT004', 'Mousepad'),
('CAT005', 'Headset'),
('CAT006', 'Earphones');

INSERT INTO Customers (CustomerID, FirstName, LastName, BirthDate, Email, PhoneNo, CreationDate, HouseNo, Street, PostalCode, City) VALUES
('C011', 'Maria', 'Garcia', '1990-01-01', 'maria.garcia@example.com', '09171234567', '2024-01-10', '100', 'Rizal St', '1000', 'Manila'),
('C012', 'Juan', 'Reyes', '1985-02-15', 'juan.reyes@example.com', '09181234567', '2024-02-20', '101', 'Bonifacio St', '1100', 'Quezon City'),
('C013', 'Ana', 'Santos', '1992-03-20', 'ana.santos@example.com', '09191234567', '2024-03-30', '102', 'Mabini St', '1200', 'Makati'),
('C014', 'Pedro', 'Cruz', '1988-04-25', 'pedro.cruz@example.com', '09201234567', '2024-04-25', '103', 'Luna St', '1300', 'Pasay'),
('C015', 'Luz', 'Gonzales', '1975-05-30', 'luz.gonzales@example.com', '09211234567', '2024-05-15', '104', 'Roxas Blvd', '1400', 'Caloocan'),
('C016', 'Jose', 'Torres', '1982-06-10', 'jose.torres@example.com', '09221234567', '2024-06-20', '105', 'Del Pilar St', '1500', 'Valenzuela'),
('C017', 'Carmen', 'Martinez', '1995-07-15', 'carmen.martinez@example.com', '09231234567', '2024-07-30', '106', 'Recto Ave', '1600', 'Pasig'),
('C018', 'Carlos', 'Perez', '1991-08-20', 'carlos.perez@example.com', '09241234567', '2024-08-15', '107', 'Aguinaldo Hwy', '1700', 'Taguig'),
('C019', 'Rosa', 'Flores', '1986-09-25', 'rosa.flores@example.com', '09251234567', '2024-09-05', '108', 'Araneta Ave', '1800', 'Parañaque'),
('C020', 'Miguel', 'Morales', '1993-10-30', 'miguel.morales@example.com', '09261234567', '2024-10-20', '109', 'Quirino Ave', '1900', 'Mandaluyong'),
('C021', 'Isabel', 'Dela Cruz', '1980-01-01', 'isabel.delacruz@example.com', '09271234567', '2024-01-11', '110', 'E Rodriguez Ave', '2000', 'San Juan'),
('C022', 'Fernando', 'Navarro', '1979-02-02', 'fernando.navarro@example.com', '09281234567', '2024-01-12', '111', 'Ortigas Ave', '2100', 'Las Piñas'),
('C023', 'Victoria', 'Rivera', '1994-03-03', 'victoria.rivera@example.com', '09291234567', '2024-01-13', '112', 'Paseo de Roxas', '2200', 'Muntinlupa'),
('C024', 'Roberto', 'Aguilar', '1987-04-04', 'roberto.aguilar@example.com', '09301234567', '2024-01-14', '113', 'McArthur Hwy', '2300', 'Malabon'),
('C025', 'Rita', 'Ortiz', '1996-05-05', 'rita.ortiz@example.com', '09311234567', '2024-01-15', '114', 'Visayas Ave', '2400', 'Navotas'),
('C026', 'Alberto', 'Lopez', '1978-06-06', 'alberto.lopez@example.com', '09321234567', '2024-01-16', '115', 'Commonwealth Ave', '2500', 'Marikina'),
('C027', 'Elena', 'Ramirez', '1983-07-07', 'elena.ramirez@example.com', '09331234567', '2024-01-17', '116', 'Quezon Ave', '2600', 'Antipolo'),
('C028', 'Manuel', 'Bautista', '1990-08-08', 'manuel.bautista@example.com', '09341234567', '2024-01-18', '117', 'España Blvd', '2700', 'Bacoor'),
('C029', 'Gloria', 'Pascual', '1984-09-09', 'gloria.pascual@example.com', '09351234567', '2024-01-19', '118', 'Ramon Magsaysay Blvd', '2800', 'Dasmariñas'),
('C030', 'Luis', 'Mendoza', '1992-10-10', 'luis.mendoza@example.com', '09361234567', '2024-01-20', '119', 'Legarda St', '2900', 'Lipa'),
('C031', 'Silvia', 'Bermudez', '1981-11-11', 'silvia.bermudez@example.com', '09371234567', '2024-01-21', '120', 'P. Tuazon Blvd', '3000', 'Lucena'),
('C032', 'Marcos', 'Estrada', '1993-12-12', 'marcos.estrada@example.com', '09381234567', '2024-01-22', '121', 'D. Tuazon Blvd', '3100', 'Tarlac City'),
('C033', 'Ramon', 'Romero', '1986-01-13', 'ramon.romero@example.com', '09391234567', '2024-01-23', '122', 'Timog Ave', '3200', 'Olongapo'),
('C034', 'Teresa', 'Domingo', '1991-02-14', 'teresa.domingo@example.com', '09401234567', '2024-01-24', '123', 'Katipunan Ave', '3300', 'Iloilo City'),
('C035', 'Francisco', 'Garcia', '1985-03-15', 'francisco.garcia@example.com', '09411234567', '2024-01-25', '124', 'Aurora Blvd', '3400', 'Baguio City'),
('C036', 'Rebecca', 'Reyes', '1994-04-16', 'rebecca.reyes@example.com', '09421234567', '2024-01-26', '125', 'Sampaloc St', '3500', 'Tagaytay'),
('C037', 'Tomas', 'Santos', '1982-05-17', 'tomas.santos@example.com', '09431234567', '2024-01-27', '126', 'Harrison St', '3600', 'Cavite City'),
('C038', 'Marta', 'Cruz', '1990-06-18', 'marta.cruz@example.com', '09441234567', '2024-01-28', '127', 'Taft Ave', '3700', 'Baguio City'),
('C039', 'Esteban', 'Gonzales', '1989-07-19', 'esteban.gonzales@example.com', '09451234567', '2024-01-29', '128', 'Evangelista St', '3800', 'Naga City'),
('C040', 'Veronica', 'Torres', '1991-08-20', 'veronica.torres@example.com', '09461234567', '2024-01-30', '129', 'Gilmore Ave', '3900', 'Zamboanga City'),
('C041', 'Vicente', 'Martinez', '1979-09-21', 'vicente.martinez@example.com', '09471234567', '2024-01-31', '130', 'Ortigas Ext', '4000', 'Davao City'),
('C042', 'Patricia', 'Perez', '1987-10-22', 'patricia.perez@example.com', '09481234567', '2024-02-01', '131', 'Greenfield Ave', '4100', 'General Santos City'),
('C043', 'Jacqueline', 'Vergara', '1993-12-03', 'jacqueline.vergara@example.com', '09501234567', '2024-02-03', '133', 'Libertad St', '4300', 'San Fernando'),
('C044', 'Santiago', 'Mendoza', '1994-01-04', 'santiago.mendoza@example.com', '09511234567', '2024-02-04', '134', 'Kalayaan Ave', '4400', 'Cebu City'),
('C045', 'Belinda', 'Aquino', '1992-02-05', 'belinda.aquino@example.com', '09521234567', '2024-02-05', '135', 'Salinas St', '4500', 'Legazpi City'),
('C046', 'Oscar', 'Padilla', '1995-03-06', 'oscar.padilla@example.com', '09531234567', '2024-02-06', '136', 'Silang St', '4600', 'San Pablo'),
('C047', 'Valeria', 'Espinosa', '1986-04-07', 'valeria.espinosa@example.com', '09541234567', '2024-02-07', '137', 'Concepcion St', '4700', 'Sorsogon'),
('C048', 'Alfonso', 'Tamayo', '1983-05-08', 'alfonso.tamayo@example.com', '09551234567', '2024-02-08', '138', 'Abad Santos St', '4800', 'Batangas City'),
('C049', 'Celeste', 'Luna', '1981-06-09', 'celeste.luna@example.com', '09561234567', '2024-02-09', '139', 'Quezon St', '4900', 'Tacloban'),
('C050', 'Rafael', 'Silva', '1988-07-10', 'rafael.silva@example.com', '09571234567', '2024-02-10', '140', 'San Juan St', '5000', 'Ormoc');

INSERT INTO OrderLine (OrderID, ProductID, QuantityOrder, Price, Subtotal) VALUES
('O-001', 'P001', 2, 3199.99, 6399.98),
('O-002', 'P017', 1, 2900.00, 2900.00),
('O-003', 'P007', 3, 2799.99, 8399.97),
('O-004', 'P022', 1, 6000.00, 6000.00),
('O-005', 'P019', 4, 1300.00, 5200.00),
('O-006', 'P020', 2, 1500.00, 3000.00),
('O-007', 'P025', 1, 3800.00, 3800.00),
('O-008', 'P030', 1, 8500.00, 8500.00),
('O-009', 'P002', 1, 6999.99, 6999.99),
('O-010', 'P006', 2, 2999.99, 5999.98),
('O-011', 'P010', 3, 2899.99, 8699.97),
('O-012', 'P016', 1, 1250.00, 1250.00),
('O-013', 'P001', 1, 3199.99, 3199.99),
('O-014', 'P011', 1, 6899.99, 6899.99),
('O-015', 'P023', 2, 7200.00, 14400.00),
('O-016', 'P028', 1, 16500.00, 16500.00),
('O-017', 'P029', 1, 7500.00, 7500.00),
('O-018', 'P013', 2, 6699.99, 13399.98),
('O-019', 'P008', 5, 2599.99, 12999.95),
('O-020', 'P004', 3, 2799.99, 8399.97);

INSERT INTO Orders (OrderID, CustomerID, OrderDate, OrderStatus, TotalCost) VALUES
('O-001', 'C001', '2024-01-15', 'Shipped', 7679.98), -- p001 2 
('O-002', 'C002', '2024-01-20', 'Processing', 3480.00), -- p017 
('O-003', 'C003', '2024-01-25', 'Delivered', 10079.96), -- p007 3 
('O-004', 'C001', '2024-01-30', 'Cancelled', 7200.00), -- p022 1
('O-005', 'C005', '2024-02-01', 'Returned', 6240.00),  -- p019 4 
('O-006', 'C006', '2024-02-05', 'Processing', 3600.00), -- p020 2
('O-007', 'C007', '2024-02-10', 'Shipped', 4560.00), -- p025  1
('O-008', 'C008', '2024-02-15', 'Delivered', 10200.00), -- p030 1
('O-009', 'C004', '2024-02-20', 'Cancelled', 8399.99), -- p002  1
('O-010', 'C010', '2024-02-25', 'Processing', 7199.98), -- p006 2
('O-011', 'C011', '2024-02-28', 'Shipped', 10439.96), -- p010 3
('O-012', 'C012', '2024-03-01', 'Processing', 1500.00), -- p016 
('O-013', 'C013', '2024-03-05', 'Delivered', 3839.99), -- p001
('O-014', 'C012', '2024-03-10', 'Cancelled', 8279.99), -- p011 
('O-015', 'C015', '2024-03-15', 'Returned', 17280.00), -- p023 2
('O-016', 'C016', '2024-03-20', 'Processing', 19800.00), -- p028
('O-017', 'C017', '2024-03-25', 'Shipped', 9000.00), -- p029
('O-018', 'C010', '2024-03-30', 'Delivered', 16079.98), -- p013 2
('O-019', 'C019', '2024-04-01', 'Cancelled', 15599.94), -- p008 5
('O-020', 'C020', '2024-04-05', 'Processing', 10079.96); -- p004 3

INSERT INTO Products (ProductID, CategoryID, ProductName, Price, QuantityInStock, DateAdded) VALUES
('P001', 'CAT001', 'MB16QHG', 3199.99, 50, '2024-01-15'),
('P002', 'CAT001', 'XG16AHPE-W', 6999.99, 30, '2024-02-25'),
('P003', 'CAT001', 'XG16AHP', 5199.99, 100, '2024-03-10'),
('P004', 'CAT001', 'VG245H', 2799.99, 80, '2024-04-10'),
('P005', 'CAT001', 'MG28UQ', 4999.99, 40, '2024-05-20'),
('P006', 'CAT003', 'SUPERLIGHTX', 2999.99, 40, '2024-05-20'),
('P007', 'CAT003', 'ULTRALITE', 2799.99, 30, '2024-06-15'),
('P008', 'CAT003', 'NIMBLEMAX', 2599.99, 25, '2024-07-10'),
('P009', 'CAT003', 'SPEEDSTER', 3199.99, 35, '2024-08-05'),
('P010', 'CAT003', 'LIGHTNING', 2899.99, 20, '2024-09-01'),
('P011', 'CAT002', 'G515 TKL', 6899.99, 20, '2024-09-01'),
('P012', 'CAT002', 'K640 TKL', 6799.99, 25, '2024-09-15'),
('P013', 'CAT002', 'M450 RGB', 6699.99, 30, '2024-10-01'),
('P014', 'CAT002', 'F350 ULTRA', 6599.99, 15, '2024-10-15'),
('P015', 'CAT002', 'X500 PRO', 6499.99, 20, '2024-11-01');
('P016', 'CAT004', 'Fantech Strike Pad', 1250.00, 187, '2024-02-15'),
('P017', 'CAT004', 'Artisan Hien', 2900.00, 278, '2024-04-22'),
('P018', 'CAT004', 'Artisan Zero', 3150.00, 113, '2024-07-04'),
('P019', 'CAT004', 'Steelseries QCK', 1300.00, 55, '2024-09-13'),
('P020', 'CAT004', 'Steelseries QCK Heavy', 1500.00, 204, '2024-03-18'),
('P021', 'CAT005', 'SteelSeries Arctis Nova', 5500.00, 283, '2024-06-25'),
('P022', 'CAT005', 'Razer Blackshark V2', 6000.00, 78, '2024-11-09'),
('P023', 'CAT005', 'Razer Kraken Kitty V2 Pro', 7200.00, 130, '2024-08-21'),
('P024', 'CAT005', 'Turtle Beach Atlas Air', 4500.00, 45, '2024-12-02'),
('P025', 'CAT005', 'Astro Gaming A10', 3800.00, 197, '2024-01-18'),
('P026', 'CAT006', 'Anker Soundcore Space A40 Truly Wireless', 3500.00, 265, '2024-05-10'),
('P027', 'CAT006', 'Sennheiser MOMENTUM True Wireless 4', 5000.00, 67, '2024-07-29'),
('P028', 'CAT006', 'MOONDROP Blessing 3', 6500.00, 200, '2024-03-04'),
('P029', 'CAT006', 'Sony WF-1000XM5 Truly Wireless', 7500.00, 149, '2024-10-16'),
('P030', 'CAT006', 'Apple AirPods Pro 2', 8500.00, 78, '2024-08-09');

INSERT INTO Supplier (SupplierID, SupplierName, EmailAddr, PhoneNo) 
VALUES 
('S-001', 'John Pork Emporium', 'contact@johnpork.com', '09123456789'),
('S-002', 'John Sloper Audio', 'info@johnsloperaudio.com', '09234567890'),
('S-003', 'Dynaquest', 'support@dynaquest.com', '09345678901'),
('S-004', 'Mouse Supply Co.', 'service@mouseco.com', '09456789012'),
('S-005', 'GameXtreme', 'contact@gamextreme.com', '09567890123');

INSERT INTO PurchaseOrderLine (PurchaseOrderLineID, ProductID, PurchaseOrderID, Cost, Quantity, Subtotal)
VALUES
(1, 'P-001', 'PO-001', 50.00, 2, 100.00),
(2, 'P-002', 'PO-002', 30.00, 5, 150.00),
(3, 'P-003', 'PO-003', 20.00, 10, 200.00),
(4, 'P-004', 'PO-004', 40.00, 3, 120.00),
(5, 'P-005', 'PO-005', 25.00, 8, 200.00),
(6, 'P-006', 'PO-006', 35.00, 4, 140.00),
(7, 'P-007', 'PO-007', 45.00, 6, 270.00),
(8, 'P-008', 'PO-008', 15.00, 12, 180.00),
(9, 'P-009', 'PO-009', 60.00, 1, 60.00),
(10, 'P-010', 'PO-010', 10.00, 20, 200.00);

INSERT INTO PurchaseOrder (PurchaseOrderID, SupplierID, OrderDate, OrderStatus, TotalCost)
VALUES
('PO-001', 'S-001', '2024-11-01', 'Pending', 100.00),
('PO-002', 'S-002', '2024-11-02', 'Completed', 150.00),
('PO-003', 'S-003', '2024-11-03', 'Pending', 200.00),
('PO-004', 'S-004', '2024-11-04', 'Cancelled', 120.00),
('PO-005', 'S-005', '2024-11-05', 'Completed', 200.00),
('PO-006', 'S-006', '2024-11-06', 'Pending', 140.00),
('PO-007', 'S-007', '2024-11-07', 'Completed', 270.00),
('PO-008', 'S-008', '2024-11-08', 'Pending', 180.00),
('PO-009', 'S-009', '2024-11-09', 'Completed', 60.00),
('PO-010', 'S-010', '2024-11-10', 'Cancelled', 200.00);

INSERT INTO Paymentinfo (PaymentID, OrderID, CardNo, CardCVC, CardExpirationMonth, CardExpirationYear, PaymentType, DateOfPayment) VALUES
('PI-001', 'O-001', '1234567812345678', '123', 12, 2025, 'Credit Card', '2024-11-20'),
('PI-002', 'O-002', '1111222233334444', '456', 11, 2025, 'Debit Card', '2024-11-19'),
('PI-003', 'O-003', '5555666677778888', '789', 10, 2026, 'Credit Card', '2024-11-18'),
('PI-004', 'O-004', '9999000011112222', '321', 9, 2025, 'Credit Card', '2024-11-17'),
('PI-005', 'O-005', NULL, NULL, NULL, NULL, 'Cash', '2024-11-16'),
('PI-006', 'O-006', '7777888899990000', '987', 7, 2025, 'Credit Card', '2024-11-15'),
('PI-007', 'O-007', '2222333344445555', '123', 6, 2026, 'Debit Card', '2024-11-14'),
('PI-008', 'O-008', '6666777788889999', '456', 5, 2027, 'Credit Card', '2024-11-13'),
('PI-009', 'O-009', NULL, NULL, NULL, NULL, 'Cash', '2024-11-12'),
('PI-010', 'O-010', '8888999900001111', '321', 4, 2025, 'Credit Card', '2024-11-11'),
('PI-011', 'O-011', '1231231231231234', '111', 12, 2025, 'Credit Card', '2024-11-10'),
('PI-012', 'O-012', '4321432143214321', '222', 11, 2025, 'Debit Card', '2024-11-09'),
('PI-013', 'O-013', NULL, NULL, NULL, NULL, 'Cash', '2024-11-08'),
('PI-014', 'O-014', '1234123412341234', '333', 10, 2026, 'Credit Card', '2024-11-07'),
('PI-015', 'O-015', '2345234523452345', '444', 9, 2025, 'Debit Card', '2024-11-06'),
('PI-016', 'O-016', NULL, NULL, NULL, NULL, 'Cash', '2024-11-05'),
('PI-017', 'O-017', '3456345634563456', '555', 8, 2027, 'Credit Card', '2024-11-04'),
('PI-018', 'O-018', '4567456745674567', '666', 7, 2026, 'Debit Card', '2024-11-03'),
('PI-019', 'O-019', '5678567856785678', '777', 6, 2028, 'Credit Card', '2024-11-02'),
('PI-020', 'O-020', NULL, NULL, NULL, NULL, 'Cash', '2024-11-01');
