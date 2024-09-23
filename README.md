# Oracle SQL Tests

## Problem Statement
This project involves creating a simple **Library Management System**. The system consists of managing books, authors, and member loans.

## SQL Commands
### 1. Creating Tables
The tables created for this system include `Authors`, `Books`, `Members`, and `Loans`.

```bash
-- Create Authors Table
CREATE TABLE Authors (
    author_id NUMBER PRIMARY KEY,
    name VARCHAR2(100),
    nationality VARCHAR2(50)
);

-- Create Books Table
CREATE TABLE Books (
    book_id NUMBER PRIMARY KEY,
    title VARCHAR2(150),
    author_id NUMBER,
    genre VARCHAR2(50),
    publish_date DATE,
    CONSTRAINT fk_author FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- Create Members Table
CREATE TABLE Members (
    member_id NUMBER PRIMARY KEY,
    name VARCHAR2(100),
    email VARCHAR2(100),
    phone VARCHAR2(20)
);

-- Create Loans Table
CREATE TABLE Loans (
    loan_id NUMBER PRIMARY KEY,
    book_id NUMBER,
    member_id NUMBER,
    loan_date DATE,
    return_date DATE,
    CONSTRAINT fk_book FOREIGN KEY (book_id) REFERENCES Books(book_id),
    CONSTRAINT fk_member FOREIGN KEY (member_id) REFERENCES Members(member_id)
);
```

SQL Operations
Performed basic DDL (Data Definition Language) operations like creating tables, altering schemas, and creating relationships.

```bash
ALTER TABLE Members ADD address VARCHAR2(255);
```
### Insert Data into Authors
```bash
INSERT INTO Authors (author_id, name, nationality) VALUES (1, 'George Orwell', 'British');
```

### Insert Data into Books
```bash
INSERT INTO Books (book_id, title, author_id, genre, publish_date) VALUES (1, '1984', 1, 'Dystopian', TO_DATE('06-08-1949', 'DD-MM-YYYY'));
```

### Update Data
```bash
UPDATE Books SET genre = 'Science Fiction' WHERE book_id = 1;
```

### Delete Data
```bash
DELETE FROM Loans WHERE loan_id = 1;
Join Queries (Retrieving Related Data):
``` 

### Retrieve Members who borrowed a specific book
```bash
SELECT M.name, B.title, L.loan_date
FROM Members M
JOIN Loans L ON M.member_id = L.member_id
JOIN Books B ON L.book_id = B.book_id
WHERE B.title = '1984';
```
### Subqueries
Retrieve authors who have more than 1 book
```bash
SELECT name FROM Authors WHERE author_id IN (SELECT author_id FROM Books GROUP BY author_id HAVING COUNT(book_id) > 1);
```

## SQL Operations
- DDL (Create Tables)
- DML (Insert, Update, Delete)
- Joins and Subqueries

## Screenshots
![Screenshot 2024-09-23 at 10 27 01](https://github.com/user-attachments/assets/976af06c-bab4-42d1-99ad-368575fa32ae)


## Explanations
The above SQL queries retrieve data from multiple related tables and manage transactions effectively.
