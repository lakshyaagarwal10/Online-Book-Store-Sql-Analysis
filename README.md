# Online Bookstore SQL Analysis

An end-to-end MySQL project that models an online bookstore and answers business questions using SQL.

## Project Overview

This project explores books, customers, and orders to analyze inventory, sales, revenue, and customer activity.

## Database Schema

- **Books** — title, author, genre, published year, price, and stock
- **Customers** — customer name, contact details, city, and country
- **Orders** — order date, quantity, amount, and links to books and customers

The setup script includes 500 sample records for each table. Customer contact details in the sample data are anonymized.

## Analysis Questions

The queries explore:

- Book genres, prices, and inventory
- Sales by genre and author
- Orders and revenue
- Repeat customers and top spenders
- Estimated stock remaining after orders

## Repository Files

- `online_book_store_setup.sql` — creates the database and tables, then loads the sample data
- `online_book_store_queries.sql` — contains the basic and advanced analysis queries

## How to Run

1. Use MySQL 8.0+ and open `online_book_store_setup.sql` in MySQL Workbench.
2. Run the setup script in a clean MySQL environment.
3. Open and run `online_book_store_queries.sql`.

## SQL Skills

Table creation, primary and foreign keys, filtering, joins, aggregation, grouping, sorting, date ranges, and `COALESCE`.
