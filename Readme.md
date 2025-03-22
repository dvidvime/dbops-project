# dbops-project
Исходный репозиторий для выполнения проекта дисциплины "DBOps"

## Структура
- migrations
  - V001__create_tables.sql 

## Подготовка базы данных

```sql
CREATE DATABASE store; -- создаем новую базу данных

\c store -- переключаемся на нее

CREATE ROLE postgresql LOGIN PASSWORD 'postgresql'; -- создаем нового пользователя

GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO postgresql; -- даем ему права на все таблицы в базе store

ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL PRIVILEGES ON TABLES TO postgresql;  -- и на новые создаваемые таблицы тоже

GRANT CREATE ON SCHEMA public TO postgresql;  -- и пусть создает их сам
```