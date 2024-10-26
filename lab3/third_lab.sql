create table Artierts (
	ArtiertID int primary key,
	ArtiertName text not null,
	BirthDate date
);

create table Galleries (
	GalleryID int primary key,
	Address text not null,
	ContactInfo text,
	Name text not null,
	OpeningHours text not null
);

create table Visitors (
	VisitorID int primary key,
	VisitorName text not null,
	VisitorAge int not null,
	Cintactinfo text not null
)

create table ArtObjects (
	ArtObjectID int primary key,
	ArtiertID int,
	GalleryID int,
	Title text not null,
	Description text not null,
	CreationDate date,
	foreign key (ArtiertID) references Artierts(ArtiertID),
	foreign key (GalleryID) references Galleries(GalleryID)
);

create table Tours (
	TourID int primary key,
	TourName text not null,
	TourDate timestamp not null,
	Quantity int,
	GalleryID int,
	GuideName string not null,
	foreign key (GalleryID) references Galleries(GalleryID)
);

create table Visits (
	VisitID int primary key,
	GalleryID int,
	VisitorID int,
	VisitDate timestamp not null,
	foreign key (GalleryID) references Galleries(GalleryID),
	foreign key (VisitorID) references Visitors(VisitorID)
);

insert into Artierts (ArtiertID, ArtiertName, BirthDate) values
(1, 'Андрей', '1980-05-20'),
(2, 'Екатерина', '1975-01-15'),
(3, 'Иван', '1990-07-30'),
(4, 'Мария', '1984-11-25'),
(5, 'Сергей', '1965-12-10'),
(6, 'Ольга', '1992-03-08'),
(7, 'Алексей', '1988-02-14'),
(8, 'Наталья', '1995-09-01'),
(9, 'Дмитрий', '1982-10-05'),
(10, 'Анна', '1993-12-12'),
(11, 'Константин', '1978-08-18'),
(12, 'Татьяна', '1991-04-20'),
(13, 'Светлана', '1989-06-30'),
(14, 'Павел', '1986-04-01'),
(15, 'Елена', '1987-05-15'),
(16, 'Руслан', '1983-07-22'),
(17, 'Анастасия', '1990-01-08'),
(18, 'Виктор', '1970-11-11'),
(19, 'Юлия', '1994-03-17'),
(20, 'Роман', '1985-09-23'),
(21, 'Дарья', '1981-10-30'),
(22, 'Григорий', '1968-02-05'),
(23, 'Ксения', '1992-11-14'),
(24, 'Степан', '1984-12-18'),
(25, 'Марина', '1987-07-10'),
(26, 'Тимофей', '1979-04-25'),
(27, 'Алёна', '1991-06-01'),
(28, 'Зоя', '1980-03-03'),
(29, 'Семен', '1967-10-20'),
(30, 'Вероника', '1993-08-30');

insert into Galleries (GalleryID, Address, ContactInfo, Name, OpeningHours) values
(1, 'Москва, ул. 1', '1234567890', 'Галерея Искусств', '10:00-20:00'),
(2, 'Санкт-Петербург, ул. 2', '0987654321', 'Северная Галерея', '11:00-19:00'),
(3, 'Казань, ул. 3', '1122334455', 'Казанская Арт', '09:00-22:00'),
(4, 'Екатеринбург, ул. 4', '2233445566', 'Арт-центр', '10:00-18:00'),
(5, 'Нижний Новгород, ул. 5', '3344556677', 'Нижегородская Галерея', '12:00-20:00'),
(6, 'Челябинск, ул. 6', '4455667788', 'Челябинская Арт-группа', '09:00-21:00'),
(7, 'Уфа, ул. 7', '5566778899', 'Уфимская Арт', '10:00-16:00'),
(8, 'Ростов-на-Дону, ул. 8', '6677889900', 'Ростовская Галерея', '11:00-19:00'),
(9, 'Волгоград, ул. 9', '7788990011', 'Волгоградская Арт', '10:00-18:00'),
(10, 'Воронеж, ул. 10', '8899001122', 'Воронежская Арт-галерея', '12:00-20:00'),
(11, 'Краснодар, ул. 11', '9900112233', 'Краснодарская Галерея', '09:00-21:00'),
(12, 'Тула, ул. 12', '1011121314', 'Тульская Арт', '10:00-20:00'),
(13, 'Брянск, ул. 13', '1213141516', 'Брянская Галерея', '10:00-18:00'),
(14, 'Тюмень, ул. 14', '1314151617', 'Тюменская Арт-группа', '09:00-21:00'),
(15, 'Ижевск, ул. 15', '1415161718', 'Ижевская Галерея', '11:00-19:00'),
(16, 'Магнитогорск, ул. 16', '1516171819', 'Магнитогорская Арт', '10:00-20:00'),
(17, 'Коломна, ул. 17', '1617181920', 'Коломенская Галерея', '12:00-20:00'),
(18, 'Архангельск, ул. 18', '1718192021', 'Архангельская Арт', '09:00-21:00'),
(19, 'Ставрополь, ул. 19', '1819202122', 'Ставропольская Арт', '10:00-20:00'),
(20, 'Пермь, ул. 20', '1920212223', 'Пермская Галерея', '10:00-17:00'),
(21, 'Сургут, ул. 21', '2021222324', 'Сургутская Арт', '11:00-19:00'),
(22, 'Набережные Челны, ул. 22', '2122232425', 'Челнинская Галерея', '09:00-21:00'),
(23, 'Зеленоград, ул. 23', '2223242526', 'Зеленоградская Арт', '09:00-20:00'),
(24, 'Таганрог, ул. 24', '2324252627', 'Таганрогская Галерея', '10:00-18:00'),
(25, 'Сочи, ул. 25', '2425262728', 'Сочинская Арт', '10:00-22:00'),
(26, 'Серпухов, ул. 26', '2526272829', 'Серпуховская Галерея', '09:00-19:00'),
(27, 'Королёв, ул. 27', '2627282930', 'Королёвская Арт', '10:00-18:00'),
(28, 'Подольск, ул. 28', '2728293031', 'Подольская Галерея', '11:00-20:00'),
(29, 'Кострома, ул. 29', '2829303132', 'Костромская Арт', '10:00-18:00'),
(30, 'Люберцы, ул. 30', '2930313233', 'Люберецкая Галерея', '10:00-21:00');

insert into Visitors (VisitorID, VisitorName, VisitorAge, Cintactinfo) values
(1, 'Алексей Петров', 25, '1111111111'),
(2, 'Ольга Смирнова', 30, '2222222222'),
(3, 'Сергей Кузнецов', 22, '3333333333'),
(4, 'Елена Иванова', 27, '4444444444'),
(5, 'Павел Васильев', 35, '5555555555'),
(6, 'Мария Шарова', 28, '6666666666'),
(7, 'Дмитрий Соловьёв', 40, '7777777777'),
(8, 'Наталья Николаева', 29, '8888888888'),
(9, 'Иван Петров', 32, '9999999999'),
(10, 'Светлана Сергеева', 24, '1010101010'),
(11, 'Константин Громов', 26, '1212121212'),
(12, 'Анастасия Ковалева', 31, '1313131313'),
(13, 'Юлия Лебедева', 23, '1414141414'),
(14, 'Руслан Афанасьев', 29, '1515151515'),
(15, 'Григорий Фёдоров', 37, '1616161616'),
(16, 'Марина Сидорова', 24, '1717171717'),
(17, 'Александр Романов', 26, '1818181818'),
(18, 'Татьяна Воробьёва', 32, '1919191919'),
(19, 'Денис Филиппов', 25, '2020202020'),
(20, 'Екатерина Лукьяненко', 29, '2121212121'),
(21, 'Семён Синицын', 30, '2222222222'),
(22, 'Надежда Давыдова', 33, '2323232323'),
(23, 'Ирина Соколова', 21, '2424242424'),
(24, 'Анатолий Шевченко', 36, '2525252525'),
(25, 'Лариса Ермакова', 30, '2626262626'),
(26, 'Олег Иванов', 28, '2727272727'),
(27, 'Кирилл Пугачёв', 34, '2828282828'),
(28, 'Светлана Мельникова', 30, '2929292929'),
(29, 'Валентина Румянцева', 27, '3030303030'),
(30, 'Тимур Котов', 22, '3131313131');

insert into ArtObjects (ArtObjectID, ArtiertID, GalleryID, Title, Description, CreationDate) values
(1, 1, 1, 'Мона Лиза', 'Известная картина, созданная Леонардо да Винчи.', '1503-10-01'),
(2, 2, 1, 'Звёздная ночь', 'Картина Ван Гога, написанная в 1889 году.', '1889-06-01'),
(3, 3, 2, 'Девушка с персиками', 'Картина Ивана Шишкина.', '1887-07-01'),
(4, 4, 2, 'Сикстинская мадонна', 'Картина Рафаэля.', '1512-01-01'),
(5, 5, 3, 'Крик', 'Картина Эдварда Мунка.', '1893-02-01'),
(6, 6, 3, 'Взгляд', 'Современная картина.', '2020-05-01'),
(7, 7, 4, 'На море', 'Картина Ивана Айвазовского.', '1855-10-01'),
(8, 8, 4, 'Венера Милосская', 'Древнегреческая скульптура.', '100-200'),
(9, 9, 5, 'Тайная вечеря', 'Фреска, созданная Леонардо да Винчи.', '1495-01-01'),
(10, 10, 5, 'Ночной дозор', 'Картина Рембрандта.', '1642-01-01'),
(11, 11, 6, 'Чёрный квадрат', 'Работа Казимира Малевича.', '1915-01-01'),
(12, 12, 6, 'Сон разума рождает чудовищ', 'Гравюра Франсиско Гойи.', '1799-01-01'),
(13, 13, 7, 'Творение Адама', 'Славная фреска Микеланджело.', '1512-01-01'),
(14, 14, 7, 'Скрипка', 'Современная работа.', '2023-01-01'),
(15, 15, 8, 'Золотая осень', 'Пейзаж.', '2000-01-01'),
(16, 16, 8, 'Рождение Венеры', 'Работа Сандро Боттичелли.', '1485-01-01'),
(17, 17, 9, 'Дни нашей жизни', 'Современная картина.', '2021-01-01'),
(18, 18, 9, 'Герника', 'Картина Пабло Пикассо.', '1937-04-01'),
(19, 19, 10, 'Девочка с перламутровой серьгой', 'Картина Яна Вермеера.', '1665-01-01'),
(20, 20, 10, 'Весна', 'Работа Сандро Боттичелли.', '1482-01-01'),
(21, 21, 11, 'Вечер', 'Современная картина.', '2025-01-01'),
(22, 22, 11, 'Тайна', 'Работа Эдварда Хоппера.', '1942-01-01'),
(23, 23, 12, 'Мир', 'Современная работа.', '2020-04-01'),
(24, 24, 12, 'Мадонна', 'Работа Модильяни.', '1910-01-01'),
(25, 25, 13, 'Снежная зимушка', 'Зимний пейзаж.', '2015-12-01'),
(26, 26, 13, 'Супрематизм', 'Работа Казимира Малевича.', '1915-01-01'),
(27, 27, 14, 'На поле', 'Картина Ивана Шишкина.', '1888-01-01'),
(28, 28, 14, 'Мирная манера', 'Современная работа.', '2022-03-01'),
(29, 29, 15, 'Гармония', 'Картинный пейзаж.', '2019-09-01'),
(30, 30, 15, 'Нептун', 'Работа Бенвенуто Челлини.', '1560-01-01');

insert into Tours (TourID, TourName, TourDate, Quantity, GalleryID, GuideName) values
(1, 'Экскурсия по галерее', '2023-11-01 10:00:00', 15, 1, 'Иванов Сергей'),
(2, 'Лекция по искусству', '2023-11-02 14:00:00', 20, 1, 'Петрова Ольга'),
(3, 'Детская экскурсия', '2023-11-03 11:00:00', 10, 2, 'Соловьёв Дмитрий'),
(4, 'История русской живописи', '2023-11-04 12:00:00', 25, 2, 'Николаев Андрей'),
(5, 'Современное искусство', '2023-11-05 16:00:00', 13, 3, 'Лебедева Юлия'),
(6, 'Секреты мастерства', '2023-11-06 10:30:00', 18, 3, 'Громов Константин'),
(7, 'Виртуальная экскурсия', '2023-11-07 14:00:00', 22, 4, 'Сидорова Марина'),
(8, 'Шедевры Европы', '2023-11-08 15:30:00', 30, 4, 'Ермакова Лариса'),
(9, 'Классическая живопись', '2023-11-09 10:00:00', 15, 5, 'Котов Тимур'),
(10, 'Мир старинных мастеров', '2023-11-10 18:00:00', 20, 5, 'Николаева Наталья'),
(11, 'Тайны галерей', '2023-11-11 11:00:00', 25, 6, 'Романов Александр'),
(12, 'Приключения в искусстве', '2023-11-12 13:00:00', 12, 6, 'Шарова Мария'),
(13, 'Погружение в живопись', '2023-11-13 17:00:00', 14, 7, 'Фёдоров Григорий'),
(14, 'Достижения русских художников', '2023-11-14 16:00:00', 19, 7, 'Афанасьев Руслан'),
(15, 'Знакомство с современным искусством', '2023-11-15 11:30:00', 16, 8, 'Ковалева Анастасия'),
(16, 'Коллекция живописи', '2023-11-16 10:00:00', 20, 8, 'Шевченко Анатолий'),
(17, 'Искусство и технологии', '2023-11-17 14:00:00', 23, 9, 'Давыдова Надежда'),
(18, ' Узнай мастера', '2023-11-18 15:30:00', 17, 9, 'Лукьяненко Екатерина'),
(19, 'Коллекция античного искусства', '2023-11-19 18:00:00', 20, 10, 'Синицын Семён'),
(20, 'Экскурсия по новинкам', '2023-11-20 11:30:00', 12, 10, 'Напалкова Вера'),
(21, 'Архитектура и искусство', '2023-11-21 13:00:00', 25, 11, 'Мельникова Светлана'),
(22, 'Мир живописи', '2023-11-22 14:30:00', 18, 11, 'Пугачёв Кирилл'),
(23, 'Философия искусства', '2023-11-23 12:00:00', 24, 12, 'Соболева Татьяна'),
(24, 'Экстраординарные художники', '2023-11-24 10:30:00', 15, 12, 'Тихонов Валентин'),
(25, 'Секреты великих шедевров', '2023-11-25 14:00:00', 27, 13, 'Васильева Анна'),
(26, 'Влияние культуры на искусство', '2023-11-26 15:15:00', 19, 13, 'Гусев Алексей'),
(27, 'Атмосфера живописи', '2023-11-27 11:45:00', 15, 14, 'Дмитриев Василий'),
(28, 'Жизнь художников', '2023-11-28 12:30:00', 23, 14, 'Никитин Артем'),
(29, 'Мастера своего дела', '2023-11-29 13:30:00', 17, 15, 'Исаев Роман'),
(30, 'Искусство в век технологий', '2023-11-30 19:00:00', 20, 15, 'Петров Игорь');

insert into Visits (VisitID, GalleryID, VisitorID, VisitDate) values
(1, 1, 1, '2023-10-01 09:30:00'),
(2, 1, 2, '2023-10-02 10:00:00'),
(3, 1, 3, '2023-10-03 11:00:00'),
(4, 2, 1, '2023-10-04 12:00:00'),
(5, 2, 4, '2023-10-05 10:30:00'),
(6, 3, 2, '2023-10-06 14:30:00'),
(7, 3, 5, '2023-10-07 15:00:00'),
(8, 4, 3, '2023-10-08 13:45:00'),
(9, 4, 6, '2023-10-09 11:15:00'),
(10, 5, 1, '2023-10-10 10:00:00'),
(11, 5, 7, '2023-10-11 11:00:00'),
(12, 6, 2, '2023-10-12 12:30:00'),
(13, 6, 8, '2023-10-13 14:00:00'),
(14, 7, 4, '2023-10-14 10:45:00'),
(15, 7, 9, '2023-10-15 15:30:00'),
(16, 8, 5, '2023-10-16 13:00:00'),
(17, 8, 10, '2023-10-17 11:00:00'),
(18, 9, 1, '2023-10-18 16:00:00'),
(19, 9, 2, '2023-10-19 14:45:00'),
(20, 10, 3, '2023-10-20 10:30:00'),
(21, 10, 4, '2023-10-21 12:00:00'),
(22, 11, 5, '2023-10-22 14:00:00'),
(23, 11, 6, '2023-10-23 11:30:00'),
(24, 12, 1, '2023-10-24 10:00:00'),
(25, 12, 7, '2023-10-25 12:15:00'),
(26, 13, 2, '2023-10-26 14:30:00'),
(27, 13, 8, '2023-10-27 15:00:00'),
(28, 14, 3, '2023-10-28 10:45:00'),
(29, 14, 9, '2023-10-29 13:15:00'),
(30, 15, 4, '2023-10-30 12:00:00');

--Вывести временные интервалы, когда каждая галерея наиболее загружена посетителями.


--Вывести количество произведений каждого художника, представленных в каждой галерее. (Галерея важнее художника)


--Вывести средний возраст посетителей каждой галереи за каждый месяц текущего года.

select 
    Galleries.Name,
    extract(month from Visits.VisitDate),
    AVG(Visitors.VisitorAge)
from 
    Galleries
join 
    Visits on Galleries.GalleryID = Visits.GalleryID
join 
    Visitors on Visits.VisitorID = Visitors.VisitorID
group by 
    Galleries.GalleryID, Galleries.Name, extract(month from Visits.VisitDate)
order by 
    Galleries.Name, extract(month from Visits.VisitDate);

--Вывести количество уникальных посетителей каждой галереи за последние 6 месяцев.

-- с join

select 
	Galleries.Name, 
	count(distinct Visits.VisitorID) 
from 
	Galleries
join 
	Visits on Galleries.GalleryID = Visits.GalleryID
where 
	Visits.VisitDate >= '2023-10-20 10:30:00.000'
group by 
	Galleries.GalleryID, Galleries.Name
order by 
	Galleries.Name;

-- с подзапросами
-- todo выводятся все, убрать где есть ноль
select 
    Galleries.Name,
    (select 
        count(distinct Visits.VisitorID) 
     from 
        Visits 
     where 
        Galleries.GalleryID = Visits.GalleryID and Visits.VisitDate >= '2023-10-20 10:30:00.000') as UniqueVisitors
from 
    Galleries
group by 
	Galleries.GalleryID, Galleries.Name
order by 
	Galleries.Name;
