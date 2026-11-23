-- Online Bookstore SQL Assignment
-- Database dialect: MySQL 8.0+

-- Database setup
CREATE DATABASE IF NOT EXISTS online_bookstore;
USE online_bookstore;

-- Create the required tables
CREATE TABLE IF NOT EXISTS Authors (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(100) NOT NULL,
    country VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    author_id INT NOT NULL,
    category VARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    published_year INT NOT NULL,
    CONSTRAINT fk_books_authors
        FOREIGN KEY (author_id) REFERENCES Authors (author_id)
);

-- Sample data: six authors from six countries
INSERT IGNORE INTO Authors (author_id, author_name, country) VALUES
    (1, 'Mira Sen', 'India'),
    (2, 'Daniel Cole', 'United States'),
    (3, 'Yuki Tanaka', 'Japan'),
    (4, 'Sofia Rossi', 'Italy'),
    (5, 'Kwame Mensah', 'Ghana'),
    (6, 'Nia Kamau', 'Kenya');

-- Sample data: ten books across four categories
INSERT IGNORE INTO Books (book_id, title, author_id, category, price, published_year) VALUES
    (1, 'Secure Java Patterns', 1, 'Programming', 899.00, 2022),
    (2, 'Practical SQL Systems', 2, 'Programming', 749.00, 2021),
    (3, 'Python from Zero', 3, 'Programming', 650.00, 2020),
    (4, 'Silent River', 4, 'Fiction', 499.00, 2019),
    (5, 'Summer on Mars', 5, 'Fiction', 620.00, 2022),
    (6, 'Stories under Rain', 1, 'Fiction', 799.00, 2023),
    (7, 'Data Maps and Models', 2, 'Data Science', 999.00, 2024),
    (8, 'Statistics for Search', 3, 'Data Science', 850.00, 2021),
    (9, 'A Short World History', 4, 'History', 450.00, 2018),
    (10, 'Small Nations, Big Ideas', 5, 'History', 600.00, 2022);

-- Section 1: Basic Queries

-- Task 1: Display all books.
SELECT * FROM Books;

-- Task 2: Display only the book title and price.
SELECT title, price
FROM Books;

-- Task 3: Display the title and price using column aliases.
SELECT title AS `Book Name`, price AS `Book Price`
FROM Books;

-- Task 4: Display all unique book categories.
SELECT DISTINCT category
FROM Books
ORDER BY category;

-- Section 2: Filtering Data

-- Task 5: Display books priced above ₹700.
SELECT *
FROM Books
WHERE price > 700;

-- Task 6: Display books priced between ₹500 and ₹800 (inclusive).
SELECT *
FROM Books
WHERE price BETWEEN 500 AND 800;

-- Task 7: Display books in the Programming category.
SELECT *
FROM Books
WHERE category = 'Programming';

-- Task 8: Display books whose titles start with the letter S.
SELECT *
FROM Books
WHERE title LIKE 'S%';

-- Task 9: Display books published after 2020.
SELECT *
FROM Books
WHERE published_year > 2020;

-- Section 3: Sorting and Limiting Results

-- Task 10: Display books sorted by price in descending order.
SELECT *
FROM Books
ORDER BY price DESC;

-- Task 11: Display the top 3 most expensive books.
SELECT *
FROM Books
ORDER BY price DESC, book_id ASC
LIMIT 3;

-- Section 4: Aggregate Functions

-- Task 12: Find the total number, total price, average, highest, and lowest book prices.
SELECT
    COUNT(*) AS total_number_of_books,
    SUM(price) AS total_price_of_all_books,
    ROUND(AVG(price), 2) AS average_book_price,
    MAX(price) AS highest_book_price,
    MIN(price) AS lowest_book_price
FROM Books;

-- Section 5: GROUP BY and HAVING

-- Task 13: Display the average book price for each category.
SELECT category, ROUND(AVG(price), 2) AS average_book_price
FROM Books
GROUP BY category
ORDER BY category;

-- Task 14: Display categories whose average book price is greater than ₹650.
SELECT category, ROUND(AVG(price), 2) AS average_book_price
FROM Books
GROUP BY category
HAVING AVG(price) > 650
ORDER BY category;

-- Section 6: Joins

-- Task 15: Display each book with its author's name using an INNER JOIN.
SELECT b.book_id, b.title, a.author_name
FROM Books AS b
INNER JOIN Authors AS a ON b.author_id = a.author_id
ORDER BY b.book_id;

-- Task 16: Display all authors and their books using a LEFT JOIN.
-- Authors without books are included with NULL book columns.
SELECT a.author_id, a.author_name, a.country, b.book_id, b.title
FROM Authors AS a
LEFT JOIN Books AS b ON a.author_id = b.author_id
ORDER BY a.author_id, b.book_id;

-- Task 17: Display all books with author details using a RIGHT JOIN.
SELECT b.book_id, b.title, b.category, b.price, b.published_year,
       a.author_id, a.author_name, a.country
FROM Authors AS a
RIGHT JOIN Books AS b ON a.author_id = b.author_id
ORDER BY b.book_id;

-- Section 7: Data Manipulation

-- Task 18: Insert a new book into the Books table.
INSERT INTO Books (book_id, title, author_id, category, price, published_year)
VALUES (11, 'SQL Query Workshop', 6, 'Programming', 680.00, 2025);

-- Task 19: Update the price of the book inserted in Task 18.
UPDATE Books
SET price = 725.00
WHERE book_id = 11;

-- Task 20: Delete the book inserted in Task 18.
DELETE FROM Books
WHERE book_id = 11;

-- Section 8: Creating Tables and Constraints

-- Task 21: Create Publishers with PRIMARY KEY, NOT NULL, UNIQUE, and DEFAULT constraints.
CREATE TABLE IF NOT EXISTS Publishers (
    publisher_id INT PRIMARY KEY AUTO_INCREMENT,
    publisher_name VARCHAR(100) NOT NULL UNIQUE,
    country VARCHAR(50) NOT NULL DEFAULT 'India',
    established_year INT NOT NULL DEFAULT 2024
);
