# dbops-project
Исходный репозиторий для выполнения проекта дисциплины "DBOps"

## Структура
- migrations
  - V001__create_tables.sql - создание таблиц
  - V002__change_schema.sql - нормализация
  - V003__insert_data.sql - вставка данных
  - V004__create_index.sql - создание индексов

## Подготовка базы данных

```sql
CREATE DATABASE store; -- создаем новую базу данных

\c store -- переключаемся на нее

CREATE ROLE postgresql LOGIN PASSWORD 'здесь пароль'; -- создаем нового пользователя

GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO postgresql; -- даем ему права на все таблицы в базе store

ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL PRIVILEGES ON TABLES TO postgresql;  -- и на новые создаваемые таблицы тоже

GRANT CREATE ON SCHEMA public TO postgresql;  -- и пусть создает их сам
```

## Статистика за прошлую неделю

Запрос, который покажет, какое количество сосисок было продано за каждый день предыдущей недели. Вам нужно получить выборку из двух столбцов — дата заказа и сумма всех заказанных сосисок во всех заказах за этот день.

```sql
select
  o.date_created
  ,sum(op.quantity)
from orders o
join order_product op on o.id = op.order_id
where o.status = 'shipped' and o.date_created >= now() - interval '7d'
group by o.date_created;
```

Время выполнения без индекса 39372.534 ms (00:39.373)

Время выполнения с индексом 3253.137 ms (00:03.253)