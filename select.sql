-- Вывести самолёты в которых больше 2 работников
SELECT airplane_id, COUNT(worker_id)
from project.worker
GROUP BY airplane_id
HAVING COUNT(worker_id) > 1
ORDER BY COUNT(worker_id) DESC;

-- Узнать какие маршруты занимают больше всего времени
SELECT route_id, time
FROM project.route
ORDER BY time DESC;

-- Узнать сколько в среднем работают пилоты и стюарды
SELECT name, position, avg(work_hours) OVER (PARTITION BY position)
FROM project.worker;

-- Вывести топ работников по стажу и их место в каждой из профессий
SELECT name, position, rank() OVER (PARTITION BY position ORDER BY work_expirience DESC) AS top
FROM project.worker;

-- нет смысла работать на одном самолёте людям, у которых разное рабочее время. Например, пилот работает 8 часов,
-- а стюард 4. Поэтому посмотрим сколько будут работать люди, если сократить их рабочий день до времени минимально
-- работающего на самолёте
SELECT name, airplane_id, first_value(work_hours) over (PARTITION BY airplane_id ORDER BY work_hours)
FROM project.worker;

-- посмотрим на список аэропортов от самого северного до южного
SELECT name
FROM project.airport
ORDER BY longitude DESC;
