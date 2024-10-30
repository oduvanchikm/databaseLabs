create table if not exists "__EFMigrationsHistory"
(
    "MigrationId"    varchar(150) not null
        constraint "PK___EFMigrationsHistory"
            primary key,
    "ProductVersion" varchar(32)  not null
);

alter table "__EFMigrationsHistory"
    owner to postgres;

create table if not exists "Role"
(
    "Id"   integer generated by default as identity
        constraint "PK_Role"
            primary key,
    "Name" text not null
);

alter table "Role"
    owner to postgres;

create table if not exists "Specialty"
(
    "Id"            integer generated by default as identity
        constraint "PK_Specialty"
            primary key,
    "NameSpecialty" text not null,
    "Description"   text not null
);

alter table "Specialty"
    owner to postgres;

create table if not exists "User"
(
    "ID"         integer generated by default as identity
        constraint "PK_User"
            primary key,
    "Name"       text                     not null,
    "FamilyName" text                     not null,
    "Email"      text                     not null,
    "Password"   text                     not null,
    "RoleID"     integer                  not null
        constraint "FK_User_Role_RoleID"
            references "Role"
            on delete cascade,
    "CreatedAt"  timestamp with time zone not null
);

alter table "User"
    owner to postgres;

create index if not exists "IX_User_RoleID"
    on "User" ("RoleID");

create table if not exists "Doctor"
(
    "Id"          integer generated by default as identity
        constraint "PK_Doctor"
            primary key,
    "Name"        text    not null,
    "FamilyName"  text    not null,
    "SpecialtyID" integer not null
        constraint "FK_Doctor_Specialty_SpecialtyID"
            references "Specialty"
            on delete cascade
);

alter table "Doctor"
    owner to postgres;

create index if not exists "IX_Doctor_SpecialtyID"
    on "Doctor" ("SpecialtyID");

create table if not exists "Appointment"
(
    "Id"       integer generated by default as identity
        constraint "PK_Appointment"
            primary key,
    "UserID"   integer                  not null
        constraint "FK_Appointment_User_UserID"
            references "User"
            on delete cascade,
    "DoctorID" integer                  not null
        constraint "FK_Appointment_Doctor_DoctorID"
            references "Doctor"
            on delete cascade,
    "Date"     timestamp with time zone not null,
    "Status"   text                     not null
);

alter table "Appointment"
    owner to postgres;

create index if not exists "IX_Appointment_DoctorID"
    on "Appointment" ("DoctorID");

create index if not exists "IX_Appointment_UserID"
    on "Appointment" ("UserID");


INSERT INTO "Specialties" ("Id", "NameSpecialty", "Description")
VALUES (0, 'Кардиология', 'Специализируется на лечении сердца и сосудов.'),
       (1, 'Неврология', 'Изучает и лечит нервную систему.'),
       (2, 'Дерматология', 'Занимается кожными заболеваниями.'),
       (3, 'Педиатрия', 'Специализируется на здоровье детей и подростков.'),
       (4, 'Офтальмология', 'Изучает заболевания глаз и их лечение.'),
       (5, 'Ортопедия', 'Занимается лечением заболеваний опорно-двигательного аппарата.'),
       (6, 'Гастроэнтерология', 'Специализируется на заболеваниях пищеварительной системы.'),
       (7, 'Эндокринология', 'Изучает гормональные нарушения и заболевания эндокринной системы.'),
       (8, 'Психиатрия', 'Занимается диагностикой и лечением психических расстройств.'),
       (9, 'Хирургия', 'Специализируется на хирургическом вмешательстве для лечения различных заболеваний.'),
       (10, 'Урология', 'Изучает заболевания мочеполовой системы.'),
       (11, 'Ревматология', 'Специализируется на заболеваниях суставов и соединительных тканей.'),
       (12, 'Терапия', 'Общая медицина, занимающаяся профилактикой и лечением заболеваний.');

INSERT INTO "Doctors" ("Id", "Name", "FamilyName", "SpecialtyID")
VALUES (0, 'Софья', 'Кузнецова', 1),
       (1, 'Алексей', 'Иванов', 2),
       (2, 'Мария', 'Петрова', 1),
       (3, 'Светлана', 'Сидорова', 2),
       (4, 'Дмитрий', 'Кузнецов', 3),
       (5, 'Елена', 'Смирнова', 4),
       (6, 'Анна', 'Попова', 5),
       (7, 'Игорь', 'Лебедев', 6),
       (8, 'Ольга', 'Морозова', 7),
       (9, 'Николай', 'Федоров', 8),
       (10, 'Татьяна', 'Коваленко', 9),
       (11, 'Виктор', 'Соловьев', 10),
       (12, 'Юлия', 'Зайцева', 11),
       (13, 'Андрей', 'Павлов', 12);

INSERT INTO "Roles" ("Id", "Name")
VALUES (0, 'Admin'),
       (1, 'Patient'),
       (2, 'Doctor');

INSERT INTO "Users" ("ID", "Name", "FamilyName", "Email", "Password", "RoleId", "CreatedAt")
VALUES (0, 'Алексей', 'Иванов', 'alexey.ivanov@example.com', 'password123', 0, '2023-10-01 10:00:00'),
       (1, 'Мария', 'Петрова', 'maria.petrova@example.com', 'password456', 1, '2023-10-02 11:30:00'),
       (2, 'Светлана', 'Сидорова', 'svetlana.sidorova@example.com', 'password789', 2, '2023-10-03 12:15:00'),
       (3, 'Дмитрий', 'Кузнецов', 'dmitry.kuznetsov@example.com', 'mypassword', 0, '2023-10-04 14:45:00'),
       (4, 'Елена', 'Смирнова', 'elena.smirnova@example.com', 'securepass', 1, '2023-10-05 09:20:00'),
       (5, 'Анна', 'Попова', 'anna.popova@example.com', 'pass1234', 2, '2023-10-06 08:00:00');

INSERT INTO "Appointments" ("AppointmentId", "UserId", "DoctorId", "Date", "Status")
VALUES (0, 0, 0, '2023-10-10 09:00:00', 'Confirmed'),
       (1, 1, 1, '2023-10-11 10:30:00', 'Pending'),
       (2, 2, 2, '2023-10-12 11:15:00', 'Cancelled'),
       (3, 3, 3, '2023-10-13 14:00:00', 'Confirmed'),
       (4, 1, 13, '2023-10-23 16:00:00', 'Pending'),
       (5, 4, 4, '2023-10-14 15:45:00', 'Pending'),
       (6, 5, 5, '2023-10-15 08:30:00', 'Confirmed'),
       (7, 0, 6, '2023-10-16 09:30:00', 'Pending'),
       (8, 1, 7, '2023-10-17 10:00:00', 'Cancelled'),
       (9, 2, 8, '2023-10-18 11:45:00', 'Confirmed'),
       (10, 3, 9, '2023-10-19 12:30:00', 'Pending'),
       (11, 4, 10, '2023-10-20 13:15:00', 'Confirmed'),
       (12, 5, 11, '2023-10-21 14:00:00', 'Cancelled'),
       (13, 0, 12, '2023-10-22 15:30:00', 'Confirmed');
