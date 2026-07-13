create table products(
id bigint generated always as identity primary key,
name varchar(100) not null
);

create table product_variants (
id bigint generated always as identity primary key,
product_id bigint not null references products(id),
size varchar(20),
color varchar(50),
sku varchar(100) not null unique,
stock integer not null default 0 check (stock >= 0)

);
