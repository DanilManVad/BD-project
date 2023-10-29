CREATE SCHEMA project;

CREATE TABLE IF NOT EXISTS project.client (
	client_id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
    documents VARCHAR(50) NOT NULL,
    documents_from date,
    documents_to date NOT NULL,
    status VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS project.airplane (
	airplane_id SERIAL PRIMARY KEY,
	model VARCHAR(50),
    life_cycle INT NOT NULL,
    economy_seats INT NOT NULL,
    bisiness_seats INT NOT NULL
);

CREATE TABLE IF NOT EXISTS project.airport (
    airport_id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50),
    latitude float NOT NULL,
    longitude float NOT NULL
);

CREATE TABLE IF NOT EXISTS project.flying_stock (
    airport_id INT PRIMARY KEY,
    airplane_id INT,
    CONSTRAINT FK_Owner FOREIGN KEY(airplane_id) REFERENCES project.airplanes(airplane_id)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT,
    CONSTRAINT FK_Owner1 FOREIGN KEY(airport_id) REFERENCES project.airport(airport_id)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT
);

CREATE TABLE IF NOT EXISTS project.worker (
    worker_id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    position varchar(50) NOT NULL,
    work_hours time NOT NULL,
    work_expirience INT,
    airplane_id INT,
    CONSTRAINT FK_Owner2 FOREIGN KEY(airplane_id) REFERENCES project.airplanes(airplane_id)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT
);

CREATE TABLE IF NOT EXISTS project.rout (
    route_id SERIAL PRIMARY KEY,
    departure_from INT NOT NULL,
    arrival_to INT NOT NULL,
    time time,
    CONSTRAINT FK_Owner3 FOREIGN KEY(departure_from) REFERENCES project.airport(airport_id)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT,
    CONSTRAINT FK_Owner4 FOREIGN KEY(arrival_to) REFERENCES project.airport(airport_id)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT
);

CREATE TABLE IF NOT EXISTS project.trip (
    trip_id SERIAL PRIMARY KEY,
    rout_id INT,
    airplane_id INT,
    client_id INT,
    CONSTRAINT FK_Owner5 FOREIGN KEY(rout_id) REFERENCES project.routs(route_id)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT,
    CONSTRAINT FK_Owner6 FOREIGN KEY(airplane_id) REFERENCES project.airplanes(airplane_id)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT,
    CONSTRAINT FK_Owner7 FOREIGN KEY(client_id) REFERENCES project.clients(client_id)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT
);

INSERT INTO project.client VALUES(1, 'Манджиев Данил Вадимович', '5673104235', '2021-12-20', '2025-10-20', 'premium');
INSERT INTO project.client VALUES(2, 'Мостовых Егор Сергеевич', '1023458954', '2019-06-30', '2029-01-15', 'premium');
INSERT INTO project.client VALUES(3, 'Ачох Дамир Русланович', '7819847298', '2008-01-02', '2024-08-06', 'premium');
INSERT INTO project.client VALUES(4, 'Бушакур Адам Халедович', '6484567120', '2004-07-11', '2045-02-27', 'premium');
INSERT INTO project.client VALUES(5, 'Бобров Алексей Алексеевич', '6198300891', '2020-01-20', '2028-11-23', 'premium');
INSERT INTO project.client VALUES(6, 'Турдиев Бакыт Болотович', '8591127692', '2001-11-12', '2036-01-20', 'premium');
INSERT INTO project.client VALUES(7, 'Попов Александр Тимурович', '7619853198', '2019-02-07', '2029-04-15', 'premium');
INSERT INTO project.client VALUES(8, 'Дивильковский Максим Михайлович', '1876490358', '1998-03-30', '2027-02-14', 'premium');
INSERT INTO project.client VALUES(9, 'Середа Андрей Николаевич', '2567149815', '1996-02-27', '2034-08-11', 'premium');
INSERT INTO project.client VALUES(10, 'Бескосая Мирославна Фёдоровна', '1111111111', '0001-01-01', '2999-12-31', 'premium');

select *
from project.client;

INSERT INTO project.airplane VALUES(1, 'Boeing 777', 10, 184, 16);
INSERT INTO project.airplane VALUES(2, 'Boeing 787 Dreamliner', 14, 115, 25);
INSERT INTO project.airplane VALUES(3, 'Boeing E-6 Mercury', 6, 14, 0);
INSERT INTO project.airplane VALUES(4, 'McDonnell Douglas F-4 Phantom II', 18, 4, 0);
INSERT INTO project.airplane VALUES(5, 'Douglas DC-8', 20, 90, 10);
INSERT INTO project.airplane VALUES(6, 'Ту-134', 8, 76, 0);
INSERT INTO project.airplane VALUES(7, 'Конкорд', 25, 112, 18);
INSERT INTO project.airplane VALUES(8, 'Airbus A330', 18, 100, 20);
INSERT INTO project.airplane VALUES(9, 'ATR 72', 7, 30, 0);
INSERT INTO project.airplane VALUES(10, 'Ил-86', 10, 87, 0);

select *
from project.airplane;

INSERT INTO project.airport VALUES(038, 'Домодедово', 'Россия', 55.44, 37.75);
INSERT INTO project.airport VALUES(968, 'Хитроу', 'Великобритания', 51.4775, 0.46);
INSERT INTO project.airport VALUES(187, 'Араксос', 'Греция', 38.15, 21.43);
INSERT INTO project.airport VALUES(876, 'Ибица', 'Испания', 38.87, 1.37);
INSERT INTO project.airport VALUES(521, 'Хаммерфест', 'Норвегия', 70.66, 23.68);
INSERT INTO project.airport VALUES(972, 'Ондангва', 'Намибия', 17.87, 15.95);
INSERT INTO project.airport VALUES(018, 'Дьёр', 'Венгрия', 47.68, 17.63);
INSERT INTO project.airport VALUES(439, 'Чачапояс', 'Перу', -6.23, -77.87);
INSERT INTO project.airport VALUES(802, 'Гамбург', 'Германия', 53.57, 10.01);
INSERT INTO project.airport VALUES(381, 'Внуково', 'Россия', 55.60, 37.29);

select *
from project.airport;

INSERT INTO project.flying_stock VALUES(038, 2);
INSERT INTO project.flying_stock VALUES(968, 4);
INSERT INTO project.flying_stock VALUES(187, 1);
INSERT INTO project.flying_stock VALUES(876, 9);
INSERT INTO project.flying_stock VALUES(521, 6);
INSERT INTO project.flying_stock VALUES(972, 8);
INSERT INTO project.flying_stock VALUES(018, 10);
INSERT INTO project.flying_stock VALUES(439, 3);
INSERT INTO project.flying_stock VALUES(802, 7);
INSERT INTO project.flying_stock VALUES(381, 5);

select *
from project.flying_stock;

INSERT INTO project.rout VALUES(1, 038, 968, '5:45:00');
INSERT INTO project.rout VALUES(2, 968, 187, '3:56:00');
INSERT INTO project.rout VALUES(3, 187, 876, '1:15:00');
INSERT INTO project.rout VALUES(4, 876, 521, '6:40:00');
INSERT INTO project.rout VALUES(5, 521, 972, '17:23:00');
INSERT INTO project.rout VALUES(6, 972, 018, '12:32:00');
INSERT INTO project.rout VALUES(7, 018, 439, '19:07:00');
INSERT INTO project.rout VALUES(8, 439, 802, '18:42:00');
INSERT INTO project.rout VALUES(9, 802, 381, '3:55:00');
INSERT INTO project.rout VALUES(10, 381, 038, '00:00:00');

select *
from project.routs;

INSERT INTO project.worker VALUES(1, 'Акантьев Александр Дмитриевич', 'пилот', '8:00:00', 10, 1);
INSERT INTO project.worker VALUES(2, 'Баран Ева Андреевна', 'пилот', '4:00:00', 7, 2);
INSERT INTO project.worker VALUES(3, 'Бурлакова Ольга Антоновна', 'стюард', '4:00:00', 9, 2);
INSERT INTO project.worker VALUES(4, 'Валеев Максум Тимурович', 'стюард', '8:00:00', 8, 1);
INSERT INTO project.worker VALUES(5, 'Дударь Анастасия Владимировна', 'пилот', '8:00:00', 6, 5);
INSERT INTO project.worker VALUES(6, 'Евсеев Иван Александрович', 'пилот', '8:00:00', 13, 7);
INSERT INTO project.worker VALUES(7, 'Ермаков Василий Павлович', 'стюард', '8:00:00', 11, 9);
INSERT INTO project.worker VALUES(8, 'Зайцев Егор Владимирович', 'стюард', '4:00:00', 29, 2);
INSERT INTO project.worker VALUES(9, 'Зарецкая Мария Станиславовна', 'пилот', '4:00:00', 2, 2);
INSERT INTO project.worker VALUES(10, 'Кожанов Глеб Дмитриевич', 'пилот', '8:00:00', 1, 6);

select *
from project.workers;

INSERT INTO project.trip VALUES(1, 1, 1, 1);
INSERT INTO project.trip VALUES(2, 2, 2, 2);
INSERT INTO project.trip VALUES(3, 3, 3, 3);
INSERT INTO project.trip VALUES(4, 4, 4, 4);
INSERT INTO project.trip VALUES(5, 5, 5, 5);
INSERT INTO project.trip VALUES(6, 6, 6, 6);
INSERT INTO project.trip VALUES(7, 7, 7, 7);
INSERT INTO project.trip VALUES(8, 8, 8, 8);
INSERT INTO project.trip VALUES(9, 9, 9, 9);
INSERT INTO project.trip VALUES(10, 10, 10, 10);

select *
from project.trip;
