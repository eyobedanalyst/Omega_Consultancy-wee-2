CREATE TABLE banks (
    id SERIAL PRIMARY KEY,
    bank_name TEXT UNIQUE
);

CREATE TABLE reviews (
    id SERIAL PRIMARY KEY,
    bank_id INT REFERENCES banks(id),
    review_text TEXT,
    rating FLOAT,
    review_date DATE,
    source TEXT
);
