-- Тест 1: Создание и проверка структуры
SELECT name FROM sqlite_master WHERE type='table' AND name='FLOWERS';

-- Тест 2: Проверка наличия колонок
PRAGMA table_info(FLOWERS);

-- Тест 3: Проверка PRIMARY KEY и AUTOINCREMENT
INSERT INTO FLOWERS (flower, sort, price) VALUES ('Роза', 'Красная', 150.00);
SELECT last_insert_rowid(); -- должно вернуть 1
