create table emails (
id bigint generated always as identity primary key,
user_id bigint not null references users(id),
email_type VARCHAR (40) not null,
sent_at timestamptz default current_timestamp,
unique (user_id, email_type)
);

INSERT INTO users (username, email, age)
VALUES
    ('anna', 'anna@example.com', 25),
    ('jan', 'jan@example.com', 30);

insert into emails (user_id, email_type) select id, 'welcome_email' from users u on conflict (user_id, email_type) do nothing;
