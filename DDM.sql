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
