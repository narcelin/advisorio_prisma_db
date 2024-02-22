/*
  Warnings:

  - You are about to drop the `courses_taken` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "courses_taken" DROP CONSTRAINT "courses_taken_course_id_fkey";

-- DropForeignKey
ALTER TABLE "courses_taken" DROP CONSTRAINT "courses_taken_student_id_fkey";

-- DropTable
DROP TABLE "courses_taken";

-- CreateTable
CREATE TABLE "course_taken" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "student_id" TEXT NOT NULL,
    "grade" INTEGER,
    "course_id" TEXT NOT NULL,

    CONSTRAINT "course_taken_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "course_taken" ADD CONSTRAINT "course_taken_student_id_fkey" FOREIGN KEY ("student_id") REFERENCES "student"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "course_taken" ADD CONSTRAINT "course_taken_course_id_fkey" FOREIGN KEY ("course_id") REFERENCES "course"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
