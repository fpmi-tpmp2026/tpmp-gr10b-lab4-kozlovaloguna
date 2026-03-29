-- Тест 2.1: Одна популярная композиция
INSERT INTO KOMPOS VALUES (2, 'Тюльпанный рай');
INSERT INTO "ORDER" VALUES (5, 2, 'Клиент1', '2025-03-01', '2025-03-02', 10);
INSERT INTO "ORDER" VALUES (6, 1, 'Клиент2', '2025-03-02', '2025-03-03', 1);

SELECT k.name, SUM(o.count) as total_sold
FROM KOMPOS k
JOIN "ORDER" o ON k.id = o.KOMPOS_id
GROUP BY k.id
ORDER BY total_sold DESC
LIMIT 1;
-- Ожидаемый результат: Тюльпанный рай, 10
-- Фактический результат: Тюльпанный рай, 10 

-- Тест 2.2: Несколько композиций с одинаковым спросом
INSERT INTO "ORDER" VALUES (7, 2, 'Клиент3', '2025-03-03', '2025-03-04', 5);
INSERT INTO "ORDER" VALUES (8, 1, 'Клиент4', '2025-03-04', '2025-03-05', 5);
-- Результат: возвращена первая по алфавиту (Розовое настроение) 

-- Тест 2.3: Нет заказов
DELETE FROM "ORDER";
SELECT k.name, SUM(o.count) as total_sold
FROM KOMPOS k
LEFT JOIN "ORDER" o ON k.id = o.KOMPOS_id
GROUP BY k.id
ORDER BY total_sold DESC
LIMIT 1;
-- Результат: NULL (или пустая запись) 
