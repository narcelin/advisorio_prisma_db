CREATE TABLE "course" (
  "id" integer PRIMARY KEY,
  "created_at" timestamp,
  "name" varchar,
  "description" text,
  "teacher" varchar,
  "course_prerequisite_id" integer,
  "special_requirements" bool,
  "course_cluster" integer,
  "course_group" integer
);

CREATE TABLE "course_prerequisite" (
  "id" integer PRIMARY KEY,
  "created_at" timestamp,
  "course_id" integer,
  "prerequisite_course_id" integer
);

CREATE TABLE "course_cluster_link" (
  "id" integer PRIMARY KEY,
  "created_at" timestamp,
  "course_cluster_id" integer,
  "course_id" integer
);

CREATE TABLE "course_cluster" (
  "id" integer PRIMARY KEY,
  "create_at" timestamp,
  "title" varcahr,
  "requirements" text
);

CREATE TABLE "student" (
  "id" integer PRIMARY KEY,
  "created_at" timestamp,
  "role" varchar,
  "username" varchar,
  "password" varchar,
  "college_of" varchar,
  "degree_id" integer
);

CREATE TABLE "coursees_taken" (
  "id" integer PRIMARY KEY,
  "created_at" timestamp,
  "student_id" integer,
  "course_id" integer
);

CREATE TABLE "degree" (
  "id" integer PRIMARY KEY,
  "created_at" timestamp,
  "title" varchar,
  "description" text
);

CREATE TABLE "degree_course_cluster_link" (
  "id" integer PRIMARY KEY,
  "create_at" timestamp,
  "degree_id" integer,
  "course_cluster_id" integer
);

COMMENT ON COLUMN "degree"."description" IS 'Content of the post';

ALTER TABLE "course_prerequisite" ADD FOREIGN KEY ("course_id") REFERENCES "course" ("id");

ALTER TABLE "course_prerequisite" ADD FOREIGN KEY ("prerequisite_course_id") REFERENCES "course" ("id");

ALTER TABLE "course_cluster_link" ADD FOREIGN KEY ("course_id") REFERENCES "course" ("id");

ALTER TABLE "course_cluster_link" ADD FOREIGN KEY ("course_cluster_id") REFERENCES "course_cluster" ("id");

ALTER TABLE "student" ADD FOREIGN KEY ("degree_id") REFERENCES "degree" ("id");

ALTER TABLE "coursees_taken" ADD FOREIGN KEY ("student_id") REFERENCES "student" ("id");

ALTER TABLE "coursees_taken" ADD FOREIGN KEY ("course_id") REFERENCES "course" ("id");

ALTER TABLE "degree_course_cluster_link" ADD FOREIGN KEY ("degree_id") REFERENCES "degree" ("id");

ALTER TABLE "degree_course_cluster_link" ADD FOREIGN KEY ("course_cluster_id") REFERENCES "course_cluster" ("id");
