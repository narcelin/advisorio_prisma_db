/*
  Warnings:

  - Made the column `student_id` on table `courses_taken` required. This step will fail if there are existing NULL values in that column.
  - Made the column `course_id` on table `courses_taken` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE "courses_taken" ALTER COLUMN "student_id" SET NOT NULL,
ALTER COLUMN "course_id" SET NOT NULL;
