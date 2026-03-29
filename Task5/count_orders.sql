-- Подготовка данных
INSERT INTO "ORDER" VALUES 
(10, 1, 'A', '2025-03-01', '2025-03-02', 1),  -- 1 день
(11, 1, 'B', '2025-03-01', '2025-03-03', 1),  -- 2 дня
(12, 1, 'C', '2025-03-01', '2025-03-05', 1),  -- 4 дня
(13, 1, 'D', '2025-03-01', '2025-03-02', 1);  -- 1 день

-- Тест 1: Подсчёт по категориям
SELECT 
    CASE 
        WHEN julianday(date_set) - julianday(date_get) = 1 THEN '1 день (+25%)'
        WHEN julianday(date_set) - julianday(date_get) = 2 THEN '2 дня (+15%)'
        ELSE '3+ дней (без надбавки)'
    END as urgency,
    COUNT(*) as orders_count
FROM "ORDER"
GROUP BY urgency;
-- Результат: 1 день: 2, 2 дня: 1, 3+ дней: 1 

-- Тест 2: Пустая таблица
DELETE FROM "ORDER";
-- Результат: 0 записей 

-- Тест 3: Все заказы с одинаковой срочностью
INSERT INTO "ORDER" VALUES (20, 1, 'X', '2025-03-01', '2025-03-02', 1);
INSERT INTO "ORDER" VALUES (21, 1, 'Y', '2025-03-01', '2025-03-02', 1);
-- Только одна категория 
