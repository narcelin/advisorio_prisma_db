/*
  Warnings:

  - You are about to drop the `coursees_taken` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "coursees_taken" DROP CONSTRAINT "coursees_taken_course_id_fkey";

-- DropForeignKey
ALTER TABLE "coursees_taken" DROP CONSTRAINT "coursees_taken_student_id_fkey";

-- DropTable
DROP TABLE "coursees_taken";

-- CreateTable
CREATE TABLE "courses_taken" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "student_id" TEXT,
    "course_id" TEXT,

    CONSTRAINT "courses_taken_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "courses_taken" ADD CONSTRAINT "courses_taken_course_id_fkey" FOREIGN KEY ("course_id") REFERENCES "course"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "courses_taken" ADD CONSTRAINT "courses_taken_student_id_fkey" FOREIGN KEY ("student_id") REFERENCES "student"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
