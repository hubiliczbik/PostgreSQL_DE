ALTER TABLE orders RENAME TO orders_old;

CREATE TABLE order_statuses (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(30) NOT NULL UNIQUE
);

INSERT INTO order_statuses (name)
SELECT DISTINCT status
FROM orders_old;

CREATE TABLE orders (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    customer_id BIGINT NOT NULL REFERENCES customers(id),
    amount NUMERIC(12,2) NOT NULL CHECK (amount >= 0),
    status_id BIGINT NOT NULL REFERENCES order_statuses(id),
    ordered_at DATE NOT NULL
);

INSERT INTO orders (id, customer_id, amount, status_id, ordered_at)
OVERRIDING SYSTEM VALUE
SELECT old.id, old.customer_id, old.amount, os.id, old.ordered_at
FROM orders_old old
JOIN order_statuses os ON os.name = old.status;
