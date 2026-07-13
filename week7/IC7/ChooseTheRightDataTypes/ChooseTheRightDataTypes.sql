create table users (
id bigint generated always as identity primary key,
username varchar(20) unique,
signup_date date not null default current_date,
email varchar(250),
is_premium boolean not null default false,
profil_bio text,
age smallint check (age between 0 and 150)

)