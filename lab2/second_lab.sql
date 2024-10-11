-- создание таблицы Suppliers
create table Suppliers (
	SupplierID int primary key,
	SupplierName text not null,
	Phone text not null,
	Email text not null,
	Address text not null unique
);

-- создание таблицы Material
create table Material (
	MateialID int primary key,
	MaterialName text not null,
	Count int --количество на складе материала
);

-- создание таблицы Products
create table Products ( 
	ProductID int primary key,
	Model text not null,
	Color text not null,
	Price money not null,
	Stock int
);

-- создание таблицы Client
create table Client (
	ClientID int primary key,
	ClientName text not null,
	Phone text not null,
	Email text not null unique,
	Address text not null
);

-- создание таблицы ProductsMaterial
create table ProductsMaterial (
	MaterialID int,
	ProductID int,
	Quantity int not null,
	primary key (MaterialID, ProductID),
	foreign key (ProductID) references Products(ProductID),
	foreign key (MaterialID) references Material(MateialID)
);

-- создание таблицы Orders
create table Orders (
	OrderID int primary key,
	ClientID int,
	OrderDate date not null,
	TotalAmount money not null,
	foreign key (ClientID) references client(clientID)
);

-- создание таблицы OrderProducts
create table OrderProducts (
	OrderProductsID int primary key,
	OrderID int,
	ProductID int,
	Quantity int not null,
	foreign key (OrderID) references orders(OrderID),
	foreign key (ProductID) references products(ProductID)
);

-- создание таблицы MaterialSupplier
create table MaterialSupplier (
	MaterialSaplierID int primary key,
	SupplierID int,
	MaterialID int,
	Quantity int not null,
	SupplyDate date,
	foreign key (SupplierID) references Suppliers(SupplierID),
	foreign key (MaterialID) references Material(MateialID)
);

-- добавлены 5 людей в таблицу Suppliers
insert into Suppliers (SupplierID, SupplierName, Phone, Email, Address) values 
(1, 'Tom', '+1-555-0101', 'contact@supplierone.com', '123 Elm Street, Springfield, USA'),
(2, 'Bob', '+1-555-0102', 'info@supliertwo.com', '456 Oak Avenue, Lincoln, USA'),
(3, 'Jany', '+1-555-0103', 'hello@supplierthree.com', '789 Pine Road, Portland, USA'),
(4, 'George', '+1-555-0104', 'support@supplierfour.com', '321 Maple Lane, Salem, USA'),
(5, 'Alice', '+1-555-0105', 'service@supplierfive.com', '654 Birch Boulevard, Eugene, USA');

-- добавлено 5 позиций в таблицу Material
insert into Material (MateialID, MaterialName, Count) values
(1, 'Steel', 100),
(2, 'Aluminum', 200),
(3, 'Copper', 150),
(4, 'Wood', 300),
(5, 'Plastic', 250);

-- добавлено 5 позиций в таблицу Products
insert into Products (ProductID, Model, Color, Price, Stock) values
(1, 'Model A', 'Red', 99.99, 50),
(2, 'Model B', 'Blue', 149.99, 30),
(3, 'Model C', 'Green', 199.99, 20),
(4, 'Model D', 'Black', 249.99, 10),
(5, 'Model E', 'White', 299.99, 5);

-- добавлены 5 людей в таблицу Client
insert into Client (ClientID, ClientName, Phone, Email, Address) values
(1, 'Иван Иванов', '+71234567890', 'ivan.ivanov@example.com', 'ул. Ленина, д. 10, кв. 5'),
(2, 'Мария Петрова', '+79876543210', 'maria.petrova@example.com', 'ул. Пушкина, д. 15, кв. 7'),
(3, 'Алексей Смирнов', '+71112223344', 'alexey.smirnov@example.com', 'ул. Советская, д. 20, кв. 2'),
(4, 'Ольга Соколова', '+79998887766', 'olga.sokolova@example.com', 'ул. Мира, д. 5, кв. 3'),
(5, 'Дмитрий Козлов', '+70001112233', 'dmitry.kozlov@example.com', 'ул. Гагарина, д. 8, кв. 11');

-- добавлено 5 позиций в таблицу Orders
insert into Orders (OrderID, ClientID, OrderDate, TotalAmount) values
(1, 1, '2023-11-01', 1500.00),
(2, 1, '2023-11-02', 2500.50),
(3, 3, '2023-11-03', 3200.75),
(4, 4, '2023-11-04', 4750.00),
(5, 2, '2023-11-05', 520.20);
