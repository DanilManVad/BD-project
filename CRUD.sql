-- CRUD-запрос к таблице worker
select *
from project.worker;

insert into project.worker values (11, 'Семячкин Александр Андреевич', 'пилот', '08:00:00', 6, 10);

update project.worker set work_expirience = 7
where name = 'Семячкин Александр Андреевич';

delete from project.worker
where name = 'Семячкин Александр Андреевич';

select *
from project.worker;

-- CRUD-запрос к таблице airplane

select *
from project.airplane;

insert into project.airplane values (11, 'Boeing 700', 20, 90, 10);

update project.airplane set life_cycle = 12
where model = 'Boeing 700';

delete from project.airplane
where model = 'Boeing 700';

select *
from project.airplane;
