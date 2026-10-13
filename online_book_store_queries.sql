USE onlinebookstore;

-- Basic queries

-- 1) Retrieve all books in the Fiction genre
SELECT *
FROM books
WHERE genre = 'Fiction';

-- 2) Find books published after 1950
SELECT *
FROM books
WHERE published_year > 1950;

-- 3) List customers from Canada
SELECT *
FROM customers
WHERE country = 'Canada';

-- 4) Show orders placed in November 2023
SELECT *
FROM orders
WHERE order_date >= '2023-11-01'
  AND order_date < '2023-12-01';

-- 5) Retrieve the total stock of books available
SELECT SUM(stock) AS total_stock
FROM books;

-- 6) Find the most expensive book
SELECT *
FROM books
ORDER BY price DESC
LIMIT 1;

-- 7) Show customers who ordered more than one copy of a book
SELECT DISTINCT c.customer_id, c.name
FROM customers AS c
JOIN orders AS o
  ON o.customer_id = c.customer_id
WHERE o.quantity > 1;

-- 8) Retrieve orders where the total amount exceeds $20
SELECT *
FROM orders
WHERE total_amount > 20;

-- 9) List all genres available in the Books table
SELECT DISTINCT genre
FROM books;

-- 10) Find the book with the lowest stock
SELECT *
FROM books
ORDER BY stock ASC
LIMIT 1;

-- 11) Calculate total revenue from all orders
SELECT SUM(total_amount) AS total_revenue
FROM orders;


-- Advanced queries

-- 1) Calculate the total number of books sold for each genre
SELECT b.genre, SUM(o.quantity) AS total_books_sold
FROM orders AS o
JOIN books AS b
  ON o.book_id = b.book_id
GROUP BY b.genre;

-- 2) Find the average price of books in the Fantasy genre
SELECT AVG(price) AS average_price
FROM books
WHERE genre = 'Fantasy';

-- 3) List customers who have placed at least two orders
SELECT customer_id, COUNT(order_id) AS order_count
FROM orders
GROUP BY customer_id
HAVING COUNT(order_id) >= 2;

-- 4) Find the most frequently ordered book
SELECT b.book_id, b.title, COUNT(o.order_id) AS order_count
FROM orders AS o
JOIN books AS b
  ON o.book_id = b.book_id
GROUP BY b.book_id, b.title
ORDER BY order_count DESC
LIMIT 1;

-- 5) Show the three most expensive Fantasy books
SELECT *
FROM books
WHERE genre = 'Fantasy'
ORDER BY price DESC
LIMIT 3;

-- 6) Calculate the total quantity of books sold by each author
SELECT b.author, SUM(o.quantity) AS total_books_sold
FROM orders AS o
JOIN books AS b
  ON o.book_id = b.book_id
GROUP BY b.author;

-- 7) List cities where orders over $30 were placed
SELECT DISTINCT c.city
FROM orders AS o
JOIN customers AS c
  ON o.customer_id = c.customer_id
WHERE o.total_amount > 30;

-- 8) Find the customer who spent the most on orders
SELECT c.customer_id, c.name, SUM(o.total_amount) AS total_spent
FROM orders AS o
JOIN customers AS c
  ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_spent DESC
LIMIT 1;

-- 9) Calculate stock remaining after fulfilling all orders
SELECT b.book_id,
       b.title,
       b.stock,
       COALESCE(SUM(o.quantity), 0) AS order_quantity,
       b.stock - COALESCE(SUM(o.quantity), 0) AS remaining_quantity
FROM books AS b
LEFT JOIN orders AS o
  ON b.book_id = o.book_id
GROUP BY b.book_id, b.title, b.stock;
