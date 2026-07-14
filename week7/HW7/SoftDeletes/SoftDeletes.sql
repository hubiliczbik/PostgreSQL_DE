UPDATE users SET deleted_at = CURRENT_TIMESTAMP WHERE id = 1;

CREATE VIEW active_users AS SELECT * FROM users WHERE deleted_at IS NULL;

DELETE FROM users WHERE deleted_at IS NOT NULL AND deleted_at < CURRENT_TIMESTAMP - INTERVAL '90 days';
