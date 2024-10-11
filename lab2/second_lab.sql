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
