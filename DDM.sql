-- 課題1
CREATE TABLE menu  (id INT, name VARCHAR(255), price INT, start_date DATE, end_date DATE);

--インデックス(2)
--課題1
CREATE TABLE companies (id INT PRIMARY KEY, name VARCHAR(255) NOT NULL, url TEXT, zip_code VARCHAR(7) NOT NULL, established_date DATE NOT NULL,memo TEXT );

--課題2

--外部キーの参照テーブル
CREATE TABLE company (id INT PRIMARY KEY, name VARCHAR(255) NOT NULL, url TEXT, zip_code VARCHAR(7) NOT NULL, established_date DATE NOT NULL, memo TEXT);

CREATE TABLE staff(
    id INT PRIMARY KEY,
    company_id INT,
    last_name VARCHAR(255) NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    birthday DATE NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    phone_number VARCHAR(11),
    salary INT,
    CONSTRAINT salary_check CHECK(salary >= 0),
    CONSTRAINT company_id_fk FOREIGN KEY (company_id) REFERENCES company(id)
    );

--商品の種類
SELECT
    product_name,
    product_code,
    category,
    price
FROM products
WHERE category = 'electronics'
;

--家計管理
SELECT
    *
FROM expenses
WHERE spent >= 200
    AND is_asset = 0
    AND (type IN ('entertainment', 'outside_dining', 'travel_vacation', 'shopping') OR type IS NULL)
;

--タンパク質が多い食べ物
SELECT
    food_name,
    carbohydrates,
    protein,
    fat,
    (protein * 4 + fat * 9 + carbohydrates * 4) AS total_calories
FROM foods
WHERE protein >= 40
    AND carbohydrates < 20
    AND fat < 10
;

-- データの表示(ORDER/LIMIT)(2)
--課題1
--最終ログイン日が新しい順に並び替えて、全レコード、全カラムを表示してください。
CREATE TABLE users (id INT PRIMARY KEY, family_name VARCHAR(255) NOT NULL, first_name VARCHAR(255) NOT NULL, nickname VARCHAR(255), prefecture VARCHAR(10) NOT NULL, phone_number VARCHAR(11) NOT NULL, age INT NOT NULL, last_logged_in DATE, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL);
INSERT INTO users VALUES (1, '山田', '太郎', 'やまぽん', '東京都', '09011111111', 22, '2022-01-02', '2022-01-01 12:01:11', '2022-01-01 12:01:11'), (2, '田中', '次郎', 'たなか', '東京都', '09022222222', 30, '2022-04-01', '2022-03-02 10:53:20', '2022-04-01 20:31:47'), (3, '佐藤', '隆', 'たかくん', '大阪府', '09033333333', 18, '2022-05-23', '2022-03-01 21:23:55', '2022-05-11 16:02:13'), (4, '松本', '健斗', NULL, '宮崎県', '09044444444', 35, '2022-01-02', '2021-11-21 14:05:42', '2022-01-02 17:52:12'), (5, '坂本', '太郎', 'たろくん', '滋賀県', '09055555555', 17, '2021-12-23', '2021-06-02 23:41:44', '2021-12-10 09:47:29'), (6, '飯島', '隆平', NULL, '東京都', '09066666666', 24, '2022-01-04', '2021-12-31 10:20:11', '2022-01-04 21:00:48'), (7, '藤本', '翔也', 'しょう', '東京都', '09077777777', 44, '2022-05-01', '2022-03-24 06:01:53', '2022-05-01 04:01:02'), (8, '山本', '圭佑', 'やまっち', '北海道', '09077777777', 39, '2022-03-16', '2021-09-03 19:56:39', '2022-03-16 09:42:56'), (9, '服部', '誠司', 'はっとり', '鹿児島県', '09099999999', 29, '2022-06-29', '2022-01-02 06:47:22', '2022-06-29 06:35:43'), (10, '城田', '浩二', 'こうくん', '石川県', '09011112222', 20, '2022-04-14', '2021-12-20 21:01:24', '2022-04-13 10:37:52'), (11, '本田', '光輝', NULL, '大阪府', '09022223333', 22, '2022-04-01', '2022-01-01 12:01:10', '2022-04-01 21:45:33');

-- SQLを記述してください
SELECT * FROM users ORDER BY last_logged_in DESC;

--課題 2
--最終ログイン日の新しい順, 年齢の若い順の順番で並び替えて、全レコード、全カラムを表示してください。

CREATE TABLE users (id INT PRIMARY KEY, family_name VARCHAR(255) NOT NULL, first_name VARCHAR(255) NOT NULL, nickname VARCHAR(255), prefecture VARCHAR(10) NOT NULL, phone_number VARCHAR(11) NOT NULL, age INT NOT NULL, last_logged_in DATE, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL);
INSERT INTO users VALUES (1, '山田', '太郎', 'やまぽん', '東京都', '09011111111', 22, '2022-01-02', '2022-01-01 12:01:11', '2022-01-01 12:01:11'), (2, '田中', '次郎', 'たなか', '東京都', '09022222222', 30, '2022-04-01', '2022-03-02 10:53:20', '2022-04-01 20:31:47'), (3, '佐藤', '隆', 'たかくん', '大阪府', '09033333333', 18, '2022-05-23', '2022-03-01 21:23:55', '2022-05-11 16:02:13'), (4, '松本', '健斗', NULL, '宮崎県', '09044444444', 35, '2022-01-02', '2021-11-21 14:05:42', '2022-01-02 17:52:12'), (5, '坂本', '太郎', 'たろくん', '滋賀県', '09055555555', 17, '2021-12-23', '2021-06-02 23:41:44', '2021-12-10 09:47:29'), (6, '飯島', '隆平', NULL, '東京都', '09066666666', 24, '2022-01-04', '2021-12-31 10:20:11', '2022-01-04 21:00:48'), (7, '藤本', '翔也', 'しょう', '東京都', '09077777777', 44, '2022-05-01', '2022-03-24 06:01:53', '2022-05-01 04:01:02'), (8, '山本', '圭佑', 'やまっち', '北海道', '09077777777', 39, '2022-03-16', '2021-09-03 19:56:39', '2022-03-16 09:42:56'), (9, '服部', '誠司', 'はっとり', '鹿児島県', '09099999999', 29, '2022-06-29', '2022-01-02 06:47:22', '2022-06-29 06:35:43'), (10, '城田', '浩二', 'こうくん', '石川県', '09011112222', 20, '2022-04-14', '2021-12-20 21:01:24', '2022-04-13 10:37:52'), (11, '本田', '光輝', NULL, '大阪府', '09022223333', 22, '2022-04-01', '2022-01-01 12:01:10', '2022-04-01 21:45:33');

-- SQLを記述してください
SELECT
    *
FROM users
ORDER BY last_logged_in DESC, age ASC
;

-- 異常終了デバッグ(問題)
-- クエリを書いてください。 --
SELECT
    model_number,
    event,
    stack_trace,
    created_at
FROM crash_logs
ORDER BY created_at DESC
;

-- 本の並べ替方(問題)
-- クエリを書いてください。 --
SELECT
    *
FROM books
ORDER BY genre ASC, height DESC, title ASC
;

--製品追加(問題)
-- クエリを書いてください。 --
INSERT INTO products VALUES
    (31, '32GB RAM DDR5', 150, 'Corsair', 'Vengeance', 'Fast speed 2 stick ram DDR5 technology', 'electronics'),
    (32, 'Harry Potter and the Sorcerer Stone I', 10, 'Bloomsbury', NULL, 'A book about Harry Potter and his magical journey.', 'books'),
    (33, 'Ceiling Fan', 350, 'Minka', 'Aire Xtreme H2O', 'A coal wet ceiling fan with remote control. It has 8 different spin speeds.', 'home');

SELECT
    *
FROM products
ORDER BY product_name ASC;

--投稿削除(問題)
-- クエリを書いてください。 --
DELETE FROM posts
WHERE id IN (1,5,6)
    OR category = 'travel_vacation'
;

SELECT
    *
FROM posts
ORDER BY category ASC, title ASC
;


--コメント編集(問題)
-- クエリを書いてください。 --
UPDATE comments
SET content = 'You are so talented. I do hope these research papers are studied more so they can someday be implemented in real life!'
WHERE id = 23
;

UPDATE comments
SET type = 'reply'
WHERE type = 'replied'
;

SELECT
    *
FROM comments
WHERE type = 'reply'
ORDER BY id ASC
LIMIT 30
;

-- 集計関数(2)
--課題1
CREATE TABLE users (id INT PRIMARY KEY, family_name VARCHAR(255) NOT NULL, first_name VARCHAR(255) NOT NULL, nickname VARCHAR(255), prefecture VARCHAR(10) NOT NULL, phone_number VARCHAR(11) NOT NULL, age INT NOT NULL, last_logged_in DATE, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL);
INSERT INTO users VALUES (1, '山田', '太郎', 'やまぽん', '東京都', '09011111111', 22, '2022-01-02', '2022-01-01 12:01:11', '2022-01-01 12:01:11'), (2, '田中', '次郎', 'たなか', '東京都', '09022222222', 30, '2022-04-01', '2022-03-02 10:53:20', '2022-04-01 20:31:47'), (3, '佐藤', '隆', 'たかくん', '大阪府', '09033333333', 18, '2022-05-23', '2022-03-01 21:23:55', '2022-05-11 16:02:13'), (4, '松本', '健斗', NULL, '宮崎県', '09044444444', 35, '2022-01-02', '2021-11-21 14:05:42', '2022-01-02 17:52:12'), (5, '坂本', '太郎', 'たろくん', '滋賀県', '09055555555', 17, '2021-12-23', '2021-06-02 23:41:44', '2021-12-10 09:47:29'), (6, '飯島', '隆平', NULL, '東京都', '09066666666', 24, '2022-01-04', '2021-12-31 10:20:11', '2022-01-04 21:00:48'), (7, '藤本', '翔也', 'しょう', '東京都', '09077777777', 44, '2022-05-01', '2022-03-24 06:01:53', '2022-05-01 04:01:02'), (8, '山本', '圭佑', 'やまっち', '北海道', '09077777777', 39, '2022-03-16', '2021-09-03 19:56:39', '2022-03-16 09:42:56'), (9, '服部', '誠司', 'はっとり', '鹿児島県', '09099999999', 29, '2022-06-29', '2022-01-02 06:47:22', '2022-06-29 06:35:43'), (10, '城田', '浩二', 'こうくん', '石川県', '09011112222', 20, '2022-04-14', '2021-12-20 21:01:24', '2022-04-13 10:37:52'), (11, '本田', '光輝', NULL, '大阪府', '09022223333', 22, '2022-04-01', '2022-01-01 12:01:10', '2022-04-01 21:45:33'), (12, '今本', '修平', 'しゅうちゃん', '東京都', '09033334444', 30, '2022-01-01', '2021-11-08 11:39:52', '2022-01-01 06:01:56');

-- SQLを記述してください
SELECT
    AVG(age)
FROM users
WHERE prefecture = '大阪府'
;

--工場の勤怠管理システム
-- クエリを書いてください。 --
SELECT
    location,
    COUNT(*)
FROM attendances
WHERE location = 'osaka'
;


--百貨店の販売管理
-- クエリを書いてください。 --
SELECT
    COUNT(*) AS sold_count,
    MAX(price)AS max_price,
    MIN(price)AS min_price,
    AVG(price)AS avgprice,
    SUM(price)AS total_price
FROM items
WHERE sold_at LIKE "2021-06%"

--HAVING
--課題1
CREATE TABLE users (id INT PRIMARY KEY, family_name VARCHAR(255) NOT NULL, first_name VARCHAR(255) NOT NULL, nickname VARCHAR(255), prefecture VARCHAR(10) NOT NULL, phone_number VARCHAR(11) NOT NULL, age INT NOT NULL, last_logged_in DATE, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL);
INSERT INTO users VALUES (1, '山田', '太郎', 'やまぽん', '東京都', '09011111111', 22, '2022-01-02', '2022-01-01 12:01:11', '2022-01-01 12:01:11'), (2, '田中', '次郎', 'たなか', '東京都', '09022222222', 30, '2022-04-01', '2022-03-02 10:53:20', '2022-04-01 20:31:47'), (3, '佐藤', '隆', 'たかくん', '大阪府', '09033333333', 18, '2022-05-23', '2022-03-01 21:23:55', '2022-05-11 16:02:13'), (4, '松本', '健斗', NULL, '宮崎県', '09044444444', 35, '2022-01-02', '2021-11-21 14:05:42', '2022-01-02 17:52:12'), (5, '坂本', '太郎', 'たろくん', '滋賀県', '09055555555', 17, '2021-12-23', '2021-06-02 23:41:44', '2021-12-10 09:47:29'), (6, '飯島', '隆平', NULL, '東京都', '09066666666', 24, '2022-01-04', '2021-12-31 10:20:11', '2022-01-04 21:00:48'), (7, '藤本', '翔也', 'しょう', '東京都', '09077777777', 44, '2022-05-01', '2022-03-24 06:01:53', '2022-05-01 04:01:02'), (8, '山本', '圭佑', 'やまっち', '北海道', '09077777777', 39, '2022-03-16', '2021-09-03 19:56:39', '2022-03-16 09:42:56'), (9, '服部', '誠司', 'はっとり', '鹿児島県', '09099999999', 29, '2022-06-29', '2022-01-02 06:47:22', '2022-06-29 06:35:43'), (10, '城田', '浩二', 'こうくん', '石川県', '09011112222', 20, '2022-04-14', '2021-12-20 21:01:24', '2022-04-13 10:37:52'), (11, '本田', '光輝', NULL, '大阪府', '09022223333', 22, '2022-04-01', '2022-01-01 12:01:10', '2022-04-01 21:45:33'), (12, '今本', '修平', 'しゅうちゃん', '東京都', '09033334444', 30, '2022-01-01', '2021-11-08 11:39:52', '2022-01-01 06:01:56'), (13, '中島', '優希', 'ゆうくん', '北海道', '09044445555', 31, '2022-04-01', '2021-10-29 12:37:48', '2022-04-01 08:11:05');

-- SQLを記述してください
SELECT
    prefecture,
    COUNT(*) AS user_num
FROM users
GROUP BY prefecture
ORDER BY user_num DESC
;

--課題2
CREATE TABLE users (id INT PRIMARY KEY, family_name VARCHAR(255) NOT NULL, first_name VARCHAR(255) NOT NULL, nickname VARCHAR(255), prefecture VARCHAR(10) NOT NULL, phone_number VARCHAR(11) NOT NULL, age INT NOT NULL, last_logged_in DATE, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL);
INSERT INTO users VALUES (1, '山田', '太郎', 'やまぽん', '東京都', '09011111111', 22, '2022-01-02', '2022-01-01 12:01:11', '2022-01-01 12:01:11'), (2, '田中', '次郎', 'たなか', '東京都', '09022222222', 30, '2022-04-01', '2022-03-02 10:53:20', '2022-04-01 20:31:47'), (3, '佐藤', '隆', 'たかくん', '大阪府', '09033333333', 18, '2022-05-23', '2022-03-01 21:23:55', '2022-05-11 16:02:13'), (4, '松本', '健斗', NULL, '宮崎県', '09044444444', 35, '2022-01-02', '2021-11-21 14:05:42', '2022-01-02 17:52:12'), (5, '坂本', '太郎', 'たろくん', '滋賀県', '09055555555', 17, '2021-12-23', '2021-06-02 23:41:44', '2021-12-10 09:47:29'), (6, '飯島', '隆平', NULL, '東京都', '09066666666', 24, '2022-01-04', '2021-12-31 10:20:11', '2022-01-04 21:00:48'), (7, '藤本', '翔也', 'しょう', '東京都', '09077777777', 44, '2022-05-01', '2022-03-24 06:01:53', '2022-05-01 04:01:02'), (8, '山本', '圭佑', 'やまっち', '北海道', '09077777777', 39, '2022-03-16', '2021-09-03 19:56:39', '2022-03-16 09:42:56'), (9, '服部', '誠司', 'はっとり', '鹿児島県', '09099999999', 29, '2022-06-29', '2022-01-02 06:47:22', '2022-06-29 06:35:43'), (10, '城田', '浩二', 'こうくん', '石川県', '09011112222', 20, '2022-04-14', '2021-12-20 21:01:24', '2022-04-13 10:37:52'), (11, '本田', '光輝', NULL, '大阪府', '09022223333', 22, '2022-04-01', '2022-01-01 12:01:10', '2022-04-01 21:45:33'), (12, '今本', '修平', 'しゅうちゃん', '東京都', '09033334444', 30, '2022-01-01', '2021-11-08 11:39:52', '2022-01-01 06:01:56'), (13, '中島', '優希', 'ゆうくん', '北海道', '09044445555', 31, '2022-04-01', '2021-10-29 12:37:48', '2022-04-01 08:11:05');

-- SQLを記述してください
SELECT
    prefecture,
    MIN(age) AS min_age
FROM users
GROUP BY prefecture
ORDER BY min_age ASC
;

--課題3
CREATE TABLE users (id INT PRIMARY KEY, family_name VARCHAR(255) NOT NULL, first_name VARCHAR(255) NOT NULL, nickname VARCHAR(255), prefecture VARCHAR(10) NOT NULL, phone_number VARCHAR(11) NOT NULL, age INT NOT NULL, last_logged_in DATE, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL);
INSERT INTO users VALUES (1, '山田', '太郎', 'やまぽん', '東京都', '09011111111', 22, '2022-01-02', '2022-01-01 12:01:11', '2022-01-01 12:01:11'), (2, '田中', '次郎', 'たなか', '東京都', '09022222222', 30, '2022-04-01', '2022-03-02 10:53:20', '2022-04-01 20:31:47'), (3, '佐藤', '隆', 'たかくん', '大阪府', '09033333333', 18, '2022-05-23', '2022-03-01 21:23:55', '2022-05-11 16:02:13'), (4, '松本', '健斗', NULL, '宮崎県', '09044444444', 35, '2022-01-02', '2021-11-21 14:05:42', '2022-01-02 17:52:12'), (5, '坂本', '太郎', 'たろくん', '滋賀県', '09055555555', 17, '2021-12-23', '2021-06-02 23:41:44', '2021-12-10 09:47:29'), (6, '飯島', '隆平', NULL, '東京都', '09066666666', 24, '2022-01-04', '2021-12-31 10:20:11', '2022-01-04 21:00:48'), (7, '藤本', '翔也', 'しょう', '東京都', '09077777777', 44, '2022-05-01', '2022-03-24 06:01:53', '2022-05-01 04:01:02'), (8, '山本', '圭佑', 'やまっち', '北海道', '09077777777', 39, '2022-03-16', '2021-09-03 19:56:39', '2022-03-16 09:42:56'), (9, '服部', '誠司', 'はっとり', '鹿児島県', '09099999999', 29, '2022-06-29', '2022-01-02 06:47:22', '2022-06-29 06:35:43'), (10, '城田', '浩二', 'こうくん', '石川県', '09011112222', 20, '2022-04-14', '2021-12-20 21:01:24', '2022-04-13 10:37:52'), (11, '本田', '光輝', NULL, '大阪府', '09022223333', 22, '2022-04-01', '2022-01-01 12:01:10', '2022-04-01 21:45:33'), (12, '今本', '修平', 'しゅうちゃん', '東京都', '09033334444', 30, '2022-01-01', '2021-11-08 11:39:52', '2022-01-01 06:01:56'), (13, '中島', '優希', 'ゆうくん', '北海道', '09044445555', 31, '2022-04-01', '2021-10-29 12:37:48', '2022-04-01 08:11:05');

-- SQLを記述してください
SELECT
    prefecture,
    MIN(age) AS min_age,
    AVG(age) AS avg_age
FROM users
WHERE nickname IS NOT NULL
GROUP BY prefecture
HAVING avg_age >= 20
ORDER BY min_age ASC
;

--文字投稿ができるSNS
-- クエリを書いてください。 --
SELECT
    tag_id,
    COUNT(*) AS sum_num
FROM posts
GROUP BY tag_id
ORDER BY sum_num DESC
LIMIT 30
;

--飛行機の予約システム
-- クエリを書いてください。 --
SELECT
    user_id,
    COUNT(*) AS reservation_count
FROM reservations
GROUP BY user_id
HAVING reservation_count >= 10
;

--営業管理システム
-- クエリを書いてください。 --

SELECT
    member_id,
    COUNT(*) AS success_count
FROM negotiations
WHERE done_at LIKE "2021-10%"
    AND status = 'SUCCESS'
GROUP BY member_id
ORDER BY success_count DESC, member_id ASC
;

--アパレルの仕入れ管理システム
-- クエリを書いてください。 --
SELECT
    product_id,
    warehouse_id,
    CASE
        WHEN month = 12 THEN year || '-12'
        WHEN month = 1  THEN year || '-01'
        WHEN month = 2  THEN year || '-02'
        WHEN month = 3  THEN year || '-03'
    END AS stock_year_month,
    COUNT(month) AS all_count
FROM warehouse
WHERE month IN (12,1,2,3)
GROUP BY product_id,warehouse_id,stock_year_month
ORDER BY stock_year_month DESC, warehouse_id ASC, product_id ASC
;

--全ユーザー対象
SELECT
    username,
    email,
    customer_first_name,
    customer_last_name,
    created_at,
    'customers' AS type
FROM customers

UNION ALL
SELECT
    username,
    email,
    employee_first_name,
    employee_last_name,
    created_at,
    'employees' AS type
FROM employees

UNION ALL
SELECT
    NULL AS username,
    email,
    first_name,
    last_name,
    created_at,
    'leads' AS type
FROM leads

ORDER BY created_at DESC
;
