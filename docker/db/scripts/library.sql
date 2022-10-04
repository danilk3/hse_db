CREATE schema IF NOT EXISTS library;

CREATE TABLE IF NOT EXISTS library.publisher (
	publisher_id INTEGER PRIMARY KEY, 
	name VARCHAR(50),
	address VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS library.reader (
	reader_id INTEGER PRIMARY KEY, 
	name VARCHAR(50),
	surname VARCHAR(50),
	address VARCHAR(50),
	birthday TIMESTAMP
);

CREATE TABLE IF NOT EXISTS library.book_category (
	book_category_id INTEGER PRIMARY KEY, 
	parent_book_category_id INTEGER NOT NULL REFERENCES library.book_category(book_category_id),
	name VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS library.book (
	isbn VARCHAR(50) PRIMARY KEY, 
	year_of_publishing TIMESTAMP,
	name VARCHAR(50) NOT NULL, 
	author VARCHAR(50) NOT NULL, 
	number_of_pages INTEGER NOT NULL,
	publisher_id INTEGER NOT NULL REFERENCES library.publisher(publisher_id),
	book_category_id INTEGER NOT NULL REFERENCES library.book_category(book_category_id)
);


CREATE TABLE IF NOT EXISTS library.book_copy (
	copy_id INTEGER PRIMARY KEY, 
	position INTEGER NOT NULL,
	isbn VARCHAR(50) NOT NULL REFERENCES library.book(isbn)
);

CREATE TABLE IF NOT EXISTS library.book_rent (
	id INTEGER PRIMARY KEY, 
	book_isbn VARCHAR(50) NOT NULL REFERENCES library.book(isbn),
	copy_id INTEGER NOT NULL REFERENCES library.book_copy(copy_id),
	reader_id INTEGER NOT NULL REFERENCES library.reader(reader_id),
	return_date TIMESTAMP
);

