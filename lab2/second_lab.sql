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
	SupplyCost money,
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
(5, 'Дмитрий Козлов', '+70001112233', '2023-11-05', 520.20),
(6, 'Иван Иванов', '+71234567890', '2023-11-01', 1500.00),
(7, 'Мария Петрова', '+79876543210', '2023-11-02', 2500.50),
(8, 'Алексей Смирнов', '+71112223344', '2023-11-03', 3200.75),
(9, 'Ольга Соколова', '+79998887766', '2023-11-04', 4750.00),
(10, 'Дмитрий Козлов', '+70001112233', '2023-11-05', 520.20),
(11, 'Иван Иванов', '+71234567890', '2023-11-01', 1500.00),
(12, 'Мария Петрова', '+79876543210', '2023-11-02', 2500.50),
(13, 'Алексей Смирнов', '+71112223344', '2023-11-03', 3200.75),
(14, 'Ольга Соколова', '+79998887766', '2023-11-04', 4750.00),
(15, 'Дмитрий Козлов', '+70001112233', '2023-11-05', 520.20);
(16, 'Елена Васильева', '+79001234567', '2023-07-06', 1300.45),
(17, 'Сергей Федоров', '+79112233445', '2023-07-07', 2700.20),
(18, 'Анна Иванова', '+79223344556', '2023-07-07', 3500.00),
(19, 'Роман Воробьев', '+79334455667', '2023-07-09', 4900.99),
(20, 'Дарья Белова', '+79445566778', '2023-07-10', 620.30),
(21, 'Константин Сидоров', '+79556677889', '2023-07-11', 2900.10),
(22, 'Татьяна Крылова', '+79667788990', '2023-07-12', 4200.75),
(23, 'Максим Лебедев', '+79778899001', '2023-07-13', 5400.80),
(24, 'Наталья Павлова', '+79889910012', '2023-08-14', 1100.55),
(25, 'Игорь Григорьев', '+79991021123', '2023-09-15', 750.45);

insert into Suppliers (SupplierID, SuppliersName, ContsctInfo) values
(1, 'Иванов И.И.', 'ivanov@example.com'),
(2, 'Петров П.П.', 'petrov@example.com'),
(3, 'Сидоров С.С.', 'sidorov@example.com'),
(4, 'Кузнецов К.К.', 'kuznetsov@example.com'),
(5, 'Смирнова А.А.', 'smirnova@example.com'),
(6, 'Иванов И.И.', 'ivanov@example.com'),
(7, 'Иванов И.И.', 'petrov@example.com'),
(8, 'Иванов И.И.', 'sidorov@example.com'),
(9, 'Кузнецов К.К.', 'kuznetsov@example.com'),
(10, 'Смирнова А.А.', 'smirnova@example.com');

insert into Material (MaterialID, MaterialName) values
(1, 'Steel'),
(2, 'Aluminum'),
(3, 'Copper'),
(4, 'Wood'),
(5, 'Plastic');

insert into ProductsOrders (OrderID, ProductID, Quantity) values
(1, 2, 30),
(2, 1, 40),
(3, 4, 30),
(5, 3, 40),
(4, 5, 40);

insert into ProductMaterials (ProductID, MaterialID, Quantity) values
(1, 2, 60),
(2, 1, 40),
(3, 4, 70),
(5, 3, 90),
(4, 5, 40);

insert into Supplies (SupplierID, MaterialID, Quantity, SupplyCost, SupplyDate) values
(1, 2, 60, 99.99, '2024-10-11'),
(2, 1, 40, 105.00, '2024-10-10'),
(3, 5, 70, 123.00, '2024-10-13'),
(5, 3, 90, 235.00, '2024-10-11'),
(4, 4, 40, 89.00, '2024-10-11');

-- Выведите список всех произведённых продуктов, отсортировав их по дате производства
select * from Products order by ProductionDate;

-- Найдите все заказы, выполненные в определённый период времени
select * from Products where ProductionDate between '2024-10-10' and '2024-10-12';

-- Выведите поставки материалов, общая стоимость которых попадает в указанные границы
select * from Supplies where SupplyCost::numeric between 120.00 and 240.00;

-- Рассчитайте общую стоимость всех произведённых продуктов для каждого заказа и сохраните результаты

-- Определите, сколько товаров было произведено для каждой модели и запишите результаты

-- Выведите заказы, в которых было произведено больше определённого количества единиц продукции

-- Обновите информацию о ценах на материалы от одного из поставщиков

-- Удалите записи о заказах, которые были выполнены более года назад
delete from ProductsOrders 
where OrderID in (
	select OrderID from Orders where OrderDate < '2023-10-11' 
);

delete from Orders where OrderDate < '2023-10-11';


-- Найдите все поставки, сделанные от определённых поставщиков
select * from Suppliers where SuppliersName = 'Иванов И.И.';

-- Выведите первые пять записей о производственных заказах, пропустив несколько первых записей

-- Подсчитайте среднюю стоимость материалов для каждого заказа и сохраните результаты

-- Отсортируйте заказы по дате их выполнения
select * from Orders order by OrderDate;

-- Выведите список поставщиков, которые выполнили наибольшее количество поставок
