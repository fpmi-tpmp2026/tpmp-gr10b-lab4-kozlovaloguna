-- Тест 1: Создание связанных записей
INSERT INTO FLOWERS (flower, sort, price) VALUES ('Тюльпан', 'Жёлтый', 80.00);
INSERT INTO KOMPOS (name) VALUES ('Весенний букет');
INSERT INTO KOMPOS_IN (FLOWERS_id, KOMPOS_id, count) VALUES (1, 1, 5);

-- Тест 2: Проверка каскадного удаления (ожидается ошибка)
DELETE FROM FLOWERS WHERE id = 1; -- должно быть запрещено FOREIGN KEY

-- Тест 3: Проверка NOT NULL ограничений
INSERT INTO KOMPOS_IN (FLOWERS_id, KOMPOS_id, count) VALUES (NULL, 1, 3); -- должно вернуть ошибку
