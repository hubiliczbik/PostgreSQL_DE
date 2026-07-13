CREATE TABLE events(
	id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	START_at timestamptz NOT NULL,
	end_at timestamptz NOT NULL,

	CONSTRAINT event_valid_dates CHECK(
		end_at >= start_at AND end_at <= start_at + INTERVAL '30 days'
		)
);
