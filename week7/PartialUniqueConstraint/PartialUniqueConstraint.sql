alter table public.users add column deleted_at timestamptz;

create unique index users_active_email_unique on public.users (email) where deleted_at is null;
