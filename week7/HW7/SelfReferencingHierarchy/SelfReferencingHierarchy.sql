CREATE TABLE categories (
	id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	name varchar(100) NOT NULL,
	parent_id bigint,

	FOREIGN KEY (parent_id) REFERENCES categories(id), CONSTRAINT categories_no_self_parent
	CHECK (parent_id IS NULL OR parent_id <> id)
);