-- Выдаёт список самолётов которые нужно заменить (до окончания срока эксплуатаций осталось меньше 1 года)
create function show_old_airplane() returns text
as $$ select airplane_id from project.airplane
    WHERE life_cycle < 1$$
language sql;

-- Если клиент поменял документы, то функция обновит его данные в таблице
create function change_documents(n integer, new_document_from date, new_document_to date) returns void AS
$$
    update project.client set documents_from = new_document_from where client_id = n;
    update project.client set documents_to = new_document_to where client_id = n;
$$
language sql;

