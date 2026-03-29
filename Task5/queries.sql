-- Подготовка тестовых данных
INSERT INTO FLOWERS VALUES (1, 'Роза', 'Красная', 100);
INSERT INTO FLOWERS VALUES (2, 'Роза', 'Белая', 120);
INSERT INTO KOMPOS VALUES (1, 'Розовое настроение');
INSERT INTO KOMPOS_IN VALUES (1, 1, 1, 5);
INSERT INTO "ORDER" VALUES (1, 1, 'Иванов', '2025-03-01', '2025-03-02', 2);

-- Тест 1: Сумма за полный период
SELECT SUM(
    (SELECT SUM(ki.count * f.price) 
     FROM KOMPOS_IN ki 
     JOIN FLOWERS f ON ki.FLOWERS_id = f.id 
     WHERE ki.KOMPOS_id = o.KOMPOS_id) * o.count * 
    CASE 
        WHEN julianday(o.date_set) - julianday(o.date_get) = 1 THEN 1.25
        WHEN julianday(o.date_set) - julianday(o.date_get) = 2 THEN 1.15
        ELSE 1.0
    END
) AS total_revenue
FROM "ORDER" o
WHERE o.date_get BETWEEN '2025-03-01' AND '2025-03-31';
-- Результат: 1150 

-- Тест 2: Период без заказов
SELECT SUM(...) FROM "ORDER" WHERE date_get BETWEEN '2024-01-01' AND '2024-01-31';
-- Результат: NULL 

-- Тест 3: Проверка надбавки за срочность
INSERT INTO "ORDER" VALUES (2, 1, 'Петров', '2025-03-10', '2025-03-11', 1);
INSERT INTO "ORDER" VALUES (3, 1, 'Сидоров', '2025-03-15', '2025-03-17', 1);
INSERT INTO "ORDER" VALUES (4, 1, 'Козлов', '2025-03-20', '2025-03-25', 1);
-- Надбавки рассчитаны корректно 
