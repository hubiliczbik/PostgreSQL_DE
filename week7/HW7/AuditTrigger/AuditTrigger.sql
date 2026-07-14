CREATE TABLE addresses (
id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
user_id BIGINT NOT NULL REFERENCES users(id),
city VARCHAR(100) NOT NULL,
street VARCHAR(150) NOT NULL,
postal_code VARCHAR(20) NOT NULL
);

CREATE TABLE addresses_history (
history_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
address_id BIGINT NOT NULL,
user_id BIGINT NOT NULL,
city VARCHAR(100) NOT NULL,
street VARCHAR(150) NOT NULL,
postal_code VARCHAR(20) NOT NULL,
archived_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE OR REPLACE FUNCTION archive_old_address()
RETURNS trigger LANGUAGE plpgsql
AS $$ BEGIN
INSERT INTO addresses_history (
address_id,
user_id,
city,
street,
postal_code)

VALUES (
OLD.id,
OLD.user_id,
OLD.city,
OLD.street,
OLD.postal_code);

RETURN NEW;
END;
$$;

CREATE TRIGGER addresses_before_update
BEFORE UPDATE ON addresses
FOR EACH ROW
EXECUTE FUNCTION archive_old_address();
