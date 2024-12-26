create table clients
(
    clientId    int primary key,
    name        varchar(20) not null,
    contactInfo varchar(30) not null
);

create table services
(
    serviceId   int primary key,
    serviceName varchar(20) not null,
    price       money
);

create table statusesForOrder
(
    statusId   int primary key,
    statusName varchar(20)
);

create table orders
(
    orderId   int primary key,
    clientId  int,
    orderDate timestamp not null,
    statusId  int,
    foreign key (clientId) references clients (clientId),
    foreign key (statusId) references statusesForOrder (statusId)
);

create table statusesForSlots
(
    statusId   int primary key,
    statusName varchar(20) not null
);

create table timeSlots
(
    slotId    int primary key,
    startTime timestamp not null,
    endTime   timestamp not null,
    statusId  int,
    foreign key (statusId) references statusesForSlots (statusId)
);

create table appointments
(
    appointmentId int primary key,
    clientId      int,
    serviceId     int,
    slotId        int,
    partId        int,
    foreign key (clientId) references clients (clientId),
    foreign key (serviceId) references services (serviceId),
    foreign key (slotId) references timeSlots (slotId),
    foreign key (partId) references parts (partId)
);

create table operationName
(
    operationId   serial primary key,
    operationName varchar(20)
);

create table logs
(
    logId       serial primary key,
    operationId int,
    tableName   varchar(20),
    time        timestamp,
    foreign key (operationId) references operationName (operationId)
);

insert into operationName(operationName)
values ('insert'),
       ('update'),
       ('delete');

create or replace function logOrderChangeTriggerFunction()
    returns trigger as
$$
begin
    if tg_op = 'INSERT' then
        insert into logs(operationId, tableName, time)
        values (1, 'Orders', now());
    elsif tg_op = 'UPDATE' then
        insert into logs(operationId, tableName, time)
        values (2, 'Orders', now());
    elsif tg_op = 'DELETE' then
        insert into logs(operationId, tableName, time)
        values (3, 'Orders', now());

    end if;
    return null;
end;
$$ language plpgsql;

create trigger orderChangeTrigger
    after insert or update or delete
    on orders
    for each row
execute function logOrderChangeTriggerFunction();

create table parts
(
    partId          serial primary key,
    partName        text not null,
    price           money,
    quantityInStock int
);

create or replace function logUpdateResultPart()
    returns trigger as
$$
begin
    update parts
    set quantityInStock = quantityInStock - 1
    where partId = new.partId;
    return new;
end;
$$ language plpgsql;

create trigger updatePartResult
    after insert
    on appointments
    for each row
execute function logUpdateResultPart();

insert into clients (clientId, name, contactInfo)
values (1, 'Alice', 'alice@example.com'),
       (2, 'Bob', 'bob@example.com'),
       (3, 'Mary', 'mary@example.com'),
       (4, 'Tom', 'tom@example.com');

insert into services (serviceId, serviceName, price)
values (1, 'Oil Change', 29.99),
       (2, 'Tire Rotation', 49.99),
       (3, 'Brake Service', 99.99),
       (4, 'Alignment', 129.99),
       (5, 'Battery Replacement', 89.99);

insert into statusesForOrder (statusId, statusName)
values (1, 'Pending'),
       (2, 'Completed');

insert into orders (orderId, clientId, orderDate, statusId)
values (1, 1, now(), 1),
       (2, 2, now(), 2),
       (3, 3, now() - interval '1 day', 1),
       (4, 4, now() - interval '2 days', 2),
       (5, 1, now() - interval '5 days', 2),
       (6, 2, now(), 1);

insert into orders (orderId, clientId, orderDate, statusId)
values (7, 4, now() - interval '6 days', 2),
       (8, 1, now() - interval '4 days', 2),
       (9, 2, now(), 1);

insert into orders (orderId, clientId, orderDate, statusId)
values (10, 4, now() - interval '7 days', 2),
       (11, 1, now() - interval '8 days', 2),
       (12, 4, now(), 1);

delete
from orders
where orderId = 12;

insert into orders (orderId, clientId, orderDate, statusId)
values (12, 4, now(), 1);

select *
from logs;

select *
from orders;

insert into statusesForSlots (statusId, statusName)
values (1, 'Available'),
       (2, 'Booked');

insert into timeSlots (slotId, startTime, endTime, statusId)
values (1, now(), now() + interval '1 hour', 1),
       (2, now() + interval '2 hours', now() + interval '3 hours', 2),
       (3, now() + interval '4 hours', now() + interval '5 hours', 1),
       (4, now() + interval '6 hours', now() + interval '7 hours', 2),
       (5, now() + interval '8 hours', now() + interval '9 hours', 1),
       (6, now() + interval '10 hours', now() + interval '11 hours', 2);

insert into parts (partName, price, quantityInStock)
values ('Oil Filter', 15.00, 100),
       ('Tire', 80.00, 50),
       ('Brake Pads', 45.00, 30),
       ('Alignment Kit', 120.00, 25),
       ('Car Battery', 100.00, 40),
       ('Spark Plug', 10.00, 200),
       ('Air Filter', 20.00, 75);

select *
from logs;

insert into appointments (appointmentId, clientId, serviceId, slotId, partId)
values (1, 4, 1, 6, 2);

select *
from parts;
