-- скрывает данные паспорта (показывает только номер, а серию скрывает)
CREATE VIEW secret_document AS
select concat(SUBSTRING(documents, 1, 4), '******')
from project.client;

-- показывает ФИО клиента и когда истекают его документы (остальные данные не нужны, когда нужно
-- отсекать тех, у которых документы уже не действительны)
CREATE VIEW old_document AS
select name, documents_to
from project.client;

-- показывает сколько маршрутов проходят через какой-то аэропорт
CREATE VIEW airport_routs AS
select name, count(*)
from project.route r
JOIN project.airport a
on a.airport_id = r.arrival_to or a.airport_id = r.departure_from
group by name;

-- показывает сколько премиум клиентов летают на каждом маршруте
CREATE VIEW premium_routs AS
select t.rout_id, count(*)
from project.trip t
JOIN project.client c
on t.client_id = c.client_id
where c.status = 'premium'
group by t.rout_id;

-- показывает сколько работников летают на каждом маршруте
CREATE VIEW worker_routs AS
select t.rout_id, count(*)
from project.trip t
JOIN project.worker w
on t.airplane_id = w.airplane_id
group by t.rout_id;

-- показывает сколько работников находятся в каком-то конкретном аэропорту
CREATE VIEW worker_airport AS
select t.airport_id, count(*)
from project.flying_stock t
JOIN project.worker w
on t.airplane_id = w.airplane_id
group by t.airport_id;
