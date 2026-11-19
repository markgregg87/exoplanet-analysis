CREATE TABLE watchlist (
	id bigserial,
	pl_name varchar(50),
	reason varchar(100),
	added_on date
);

INSERT INTO watchlist (pl_name, reason, added_on)
VALUES ('TRAPPIST-1 e', 'Rocky, in habitable zone', '2026-11-16'),
       ('Proxima Cen b', 'Closest exoplanet to Earth', '2026-11-16'),
       ('51 Peg b', 'First planet found around a Sun-like star', '2026-11-16');
