-- если человек изменяет паспорт, то триггер автоматически вставляет дату, когда он истекает (+ 25 лет)
CREATE OR REPLACE FUNCTION update_documents() RETURNS TRIGGER AS $$
BEGIN
NEW.documents_to = (NEW.documents_from + interval '25 years')::date;
RETURN NEW;
END
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER update_documents_trigger
AFTER UPDATE ON project.client
FOR EACH ROW
EXECUTE FUNCTION update_documents();

-- при добавлений нового маршрута добавляет автоматически новые по возможности
CREATE OR REPLACE FUNCTION update_route() RETURNS TRIGGER AS $$
BEGIN
INSERT INTO project.route(departure_from, arrival_to, time)
(select departure_from, NEW.arrival_to, time
from project.route
where arrival_to = NEW.departure_from);
RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER update_route_trigger
AFTER INSERT ON project.route
FOR EACH ROW
EXECUTE FUNCTION update_route();

