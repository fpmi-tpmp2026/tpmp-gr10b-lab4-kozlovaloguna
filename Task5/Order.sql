-- Тест 1: Вставка корректного заказа
INSERT INTO "ORDER" (KOMPOS_id, customer, date_get, date_set, count) 
VALUES (1, 'Иванов Иван', '2025-03-25', '2025-03-27', 2);

-- Тест 2: Проверка формата дат (ожидается ошибка при неверном формате)
INSERT INTO "ORDER" (KOMPOS_id, customer, date_get, date_set, count) 
VALUES (1, 'Петров Пётр', '25.03.2025', '27.03.2025', 1); -- неверный формат

-- Тест 3: Проверка отрицательного количества
INSERT INTO "ORDER" (KOMPOS_id, customer, date_get, date_set, count) 
VALUES (1, 'Сидоров Сидор', '2025-03-25', '2025-03-26', -5); -- должно быть отклонено
