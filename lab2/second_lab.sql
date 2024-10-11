
-- -- добавлено 5 позиций в таблицу OrderProducts
-- insert into OrderProducts (OrderProductsID, OrderID, ProductID, Quantity) 
-- values 
-- (1, 1, 2, 2),
-- (2, 2, 3, 1),
-- (3, 3, 1, 5),
-- (4, 4, 4, 3),
-- (5, 5, 5, 4);

-- -- добавлено 5 позиций в таблицу productsmaterial
-- insert into productsmaterial (MaterialID, ProductID, Quantity) values
-- (1, 2, 10),
-- (2, 4, 5),
-- (3, 3, 15),
-- (4, 1, 20),
-- (5, 5, 8);

-- -- добавлено 5 позиций в таблицу materialsupplier
-- insert into materialsupplier (materialsaplierid, supplierid, materialid, quantity, supplydate) values
-- (1, 1, 3, 500, '2023-10-01'),
-- (2, 2, 4, 300, '2023-10-02'),
-- (3, 3, 5, 400, '2023-10-03'),
-- (4, 4, 1, 250, '2023-10-04'),
-- (5, 5, 2, 350, '2023-10-05');

create table Products (
	ProductId int primary key,
	Model text,
	Color text,
	SizeProd int,
	ProductionDate date not null,
	Cost money
);

create table Orders (
	OrderID int primary key,
	ClientName text not null,
	ClientPhone text,
	OrderDate date not null,
	Cost money
);

create table ProductsOrders (
	OrderID int,
	ProductID int, 
	Quantity int,
	primary key (OrderID, ProductID),
	foreign key (OrderID) references Orders(OrderID),
	foreign key (ProductID) references Products(ProductId)
);

create table Suppliers (
	SupplierID int primary key,
	SuppliersName text,
	ContsctInfo text
);

create table Material (
	MaterialID int primary key,
	MaterialName text not null
);

create table Supplies (
	SupplierID int,
	MaterialID int, 
	Quantity int, 
	Cost money,
	SupplyDate date,
	primary key (SupplierID, MaterialID),
	foreign key (SupplierID) references Suppliers(SupplierID),
	foreign key (MaterialID) references Material(MaterialID)
);

create table ProductMaterials (
	ProductID int,
	MaterialID int,
	Quantity int,
	primary key (MaterialID, ProductID),
	foreign key (MaterialID) references Material(MaterialID),
	foreign key (ProductID) references Products(ProductID)
);

insert into Products (ProductID, Model, Color, SizeProd, ProductionDate, Cost) values
(1, 'Model A', 'Red', 30, '2024-10-11' 99.99, 50),
(2, 'Model B', 'Blue', 40, '2024-10-12', 149.99, 30),
(3, 'Model C', 'Green', 50, '2024-10-10', 199.99, 20),
(4, 'Model D', 'Black', 60, '2024-10-09', 249.99, 10),
(5, 'Model E', 'White', 70, '2024-10-07', 299.99, 5);

insert into Orders (OrderID, ClientName, ClientPhone, OrderDate, Cost) values
(1, 'Иван Иванов', '+71234567890', '2023-11-01', 1500.00),
(2, 'Мария Петрова', '+79876543210', '2023-11-02', 2500.50),
(3, 'Алексей Смирнов', '+71112223344', '2023-11-03', 3200.75),
(4, 'Ольга Соколова', '+79998887766', '2023-11-04', 4750.00),
(5, 'Дмитрий Козлов', '+70001112233', '2023-11-05', 520.20);

insert into Suppliers (SupplierID, SuppliersName, ContsctInfo) values
(1, 'Иванов И.И.', 'ivanov@example.com'),
(2, 'Петров П.П.', 'petrov@example.com'),
(3, 'Сидоров С.С.', 'sidorov@example.com'),
(4, 'Кузнецов К.К.', 'kuznetsov@example.com'),
(5, 'Смирнова А.А.', 'smirnova@example.com');

insert into Material (MaterialID, MaterialName) values
(1, 'Steel'),
(2, 'Aluminum'),
(3, 'Copper'),
(4, 'Wood'),
(5, 'Plastic');
