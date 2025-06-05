-- 1
--products テーブルの name カラムのみを出力してください。
CREATE TABLE products (id INT, name VARCHAR(255) NOT NULL);
INSERT INTO products (id, name) VALUES (1, 'バナソニックレンジ'), (2, 'ゾニーカメラ'), (3, 'とうじばエアコン'), (4, 'シャーブテレビ');
-- SQLを実行してください
SELECT name FROM products;


--商品データ問題
-- クエリを書いてください。 --
SELECT * FROM products;

--本の人気度問題
-- クエリを書いてください。 --
SELECT title,view_count,id,isbn FROM books;

--更新ログ問題
-- クエリを書いてください。 --
SELECT created_at,updated_at FROM users;
