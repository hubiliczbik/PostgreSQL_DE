create table posts_no_action (
id bigint generated always as identity primary key,
user_id bigint not null,
content text,
foreign key (user_id) references users(id) on delete no action);

create table posts_cascade (
id bigint generated always as identity primary key,
user_id bigint not null,
content text,
foreign key (user_id) references users(id) on delete cascade);

create table posts_set_null (
id bigint generated always as identity primary key,
user_id bigint not null,
content text,
foreign key (user_id) references users(id) on delete set null);

create table posts_restrict (
id bigint generated always as identity primary key,
user_id bigint not null,
content text,
foreign key (user_id) references users(id) on delete restrict);
