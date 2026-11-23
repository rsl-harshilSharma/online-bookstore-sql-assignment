# Online Bookstore SQL Assignment

An introductory SQL assignment for an online bookstore database. The script creates and seeds the `Authors` and `Books` tables, then demonstrates basic queries, filtering, sorting, aggregation, grouping, joins, data manipulation, and table constraints.

## Database schema

- **Authors**: `author_id` (primary key), `author_name`, `country`
- **Books**: `book_id` (primary key), `title`, `author_id` (foreign key to `Authors.author_id`), `category`, `price`, `published_year`
- **Publishers** (Task 21): `publisher_id` (auto-increment primary key), `publisher_name` (not null and unique), `country` (not null, defaults to `India`), and `established_year` (not null, defaults to `2024`)

The sample data contains six authors from different countries and ten books across four categories. One author intentionally has no books so Task 16 demonstrates how a `LEFT JOIN` retains unmatched authors.

## Requirements

- MySQL 8.0 or newer
- A MySQL client such as MySQL Workbench or the `mysql` command-line client

## Execute the SQL script

From a terminal with MySQL installed, run:

```bash
mysql -u your_username -p < online_bookstore_assignment.sql
```

The script creates and selects the `online_bookstore` database, creates the tables if they do not already exist, inserts the sample rows, and executes Tasks 1–21 in assignment order. Your MySQL user needs permission to create a database and tables.

Alternatively, open `online_bookstore_assignment.sql` in MySQL Workbench and execute the script. The sample author and book inserts use `INSERT IGNORE`, allowing the script to be run again without duplicate primary-key errors. Tasks 18–20 insert, update, and then delete the example book with ID `11`.

The script uses MySQL syntax, including `CREATE DATABASE`, `USE`, `LIMIT`, and `AUTO_INCREMENT`.

## Task 21 constraints

The `Publishers` table applies all requested constraint types:

- `PRIMARY KEY` on `publisher_id`
- `NOT NULL` on required columns
- `UNIQUE` on `publisher_name`
- `DEFAULT` values for `country` and `established_year`

## Screenshot evidence

Capture successful execution in your SQL client and save the images in `screenshots/` using these names:

- `task-12-aggregate-functions.png` — Task 12 aggregate result
- `task-15-inner-join.png` — Task 15 book and author results
- `task-21-create-table.png` — successful execution of the `Publishers` table statement
