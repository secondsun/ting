alter table events add created_date timestamp without time zone;
alter table events add updated_date timestamp without time zone;
alter table events add version integer;

alter table users add created_date timestamp without time zone;
alter table users add updated_date timestamp without time zone;
alter table users add version integer;

CREATE TABLE cfp_submissions
(
  id bigint NOT NULL,
  created_date timestamp without time zone,
  updated_date timestamp without time zone,
  version integer,
  bio character varying(255),
  first_name character varying(255),
  google_plus_id character varying(255),
  last_name character varying(255),
  linked_in_id character varying(255),
  twitter_id character varying(255),
  description character varying(255),
  email character varying(255),
  phone character varying(255),
  picture_file2 bytea,
  presentation_type bigint,
  session_recording_approved boolean NOT NULL,
  skill_level bigint,
  slot_preference character varying(255),
  title character varying(255),
  topic character varying(255),
  tshirt_size character varying(255),
  picture bigint,
  event bigint,
  CONSTRAINT cfp_submissions_pkey PRIMARY KEY (id),
  CONSTRAINT fk_93jnud4hv6d4pykxfur3luak1 FOREIGN KEY (event)
      REFERENCES events (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_srgk1qvqa9tx8hrnfa703bifc FOREIGN KEY (picture)
      REFERENCES file_data (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE cfp_submissions
  OWNER TO devnexus;

ALTER TABLE organizers ADD COLUMN linked_in_id character varying(255);

ALTER TABLE speakers ADD COLUMN linked_in_id character varying(255);

-- 2013 -Oct 22
ALTER TABLE users ADD COLUMN created_date timestamp without time zone;
-- Change column name to 'updated_date'
ALTER TABLE users ADD COLUMN updated_date timestamp without time zone;
ALTER TABLE users ADD COLUMN version integer;

-- 2013 -Oct 26
ALTER TABLE cfp_submissions ALTER COLUMN bio TYPE character varying(10000);
ALTER TABLE cfp_submissions ALTER COLUMN description TYPE character varying(10000);
ALTER TABLE cfp_submissions ALTER COLUMN slot_preference TYPE character varying(1000);

-- 2013 - Nov 29

create table USER_AUTHORITIES (
	ID int8 not null,
	CREATED_DATE timestamp,
	UPDATED_DATE timestamp,
	VERSION int4,
	AUTHORITY int8,
	USER_ID int8,
	primary key (ID)
)

create index USER_AUTHORITIES_IDX on USER_AUTHORITIES (AUTHORITY)

alter table USER_AUTHORITIES
	add constraint FK_USER_AUTHORITIES_USERS
	foreign key (USER_ID)
	references USERS

-- 2013 - Dec 04

update events set version = '1' where version is null

-- 2013 - Dec 19
ALTER TABLE cfp_submissions ADD COLUMN status character varying(30);

-- 2013 - Dec 30
update users set version='1' where version is null

-- 2013 - Dec 31
ALTER TABLE organizers ADD COLUMN github_id character varying(255);
ALTER TABLE speakers   ADD COLUMN github_id character varying(255);

ALTER TABLE organizers ADD COLUMN lanyrd_id character varying(255);
ALTER TABLE speakers   ADD COLUMN lanyrd_id character varying(255);

