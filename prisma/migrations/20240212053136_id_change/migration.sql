/*
  Warnings:

  - You are about to drop the `Course` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `CoursePrerequisites` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `CoursesBlock` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `CoursesTaken` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Degree` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Student` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "CoursePrerequisites" DROP CONSTRAINT "CoursePrerequisites_courseId_Prereq_fkey";

-- DropForeignKey
ALTER TABLE "CoursePrerequisites" DROP CONSTRAINT "CoursePrerequisites_courseId_fkey";

-- DropForeignKey
ALTER TABLE "CoursesBlock" DROP CONSTRAINT "CoursesBlock_courseId_fkey";

-- DropForeignKey
ALTER TABLE "CoursesBlock" DROP CONSTRAINT "CoursesBlock_degreeId_fkey";

-- DropForeignKey
ALTER TABLE "CoursesTaken" DROP CONSTRAINT "CoursesTaken_courseId_fkey";

-- DropForeignKey
ALTER TABLE "CoursesTaken" DROP CONSTRAINT "CoursesTaken_studentId_fkey";

-- DropForeignKey
ALTER TABLE "Student" DROP CONSTRAINT "Student_degreeId_fkey";

-- DropTable
DROP TABLE "Course";

-- DropTable
DROP TABLE "CoursePrerequisites";

-- DropTable
DROP TABLE "CoursesBlock";

-- DropTable
DROP TABLE "CoursesTaken";

-- DropTable
DROP TABLE "Degree";

-- DropTable
DROP TABLE "Student";

-- CreateTable
CREATE TABLE "course" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(6),
    "name" VARCHAR,
    "description" TEXT,
    "teacher" VARCHAR,
    "course_prerequisite_id" INTEGER,
    "special_requirements" BOOLEAN,
    "course_cluster" INTEGER,

    CONSTRAINT "course_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "course_cluster" (
    "id" TEXT NOT NULL,
    "create_at" TIMESTAMP(6),
    "title" VARCHAR,
    "requirements" TEXT,

    CONSTRAINT "course_cluster_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "course_cluster_link" (
    "id" SERIAL NOT NULL,
    "created_at" TIMESTAMP(6),
    "course_cluster_id" TEXT,
    "course_id" TEXT,

    CONSTRAINT "course_cluster_link_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "course_prerequisite" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(6),
    "course_id" TEXT,
    "prerequisite_course_id" TEXT,

    CONSTRAINT "course_prerequisite_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "coursees_taken" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(6),
    "student_id" TEXT,
    "course_id" TEXT,

    CONSTRAINT "coursees_taken_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "degree" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(6),
    "title" VARCHAR,
    "description" TEXT,

    CONSTRAINT "degree_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "degree_course_cluster_link" (
    "id" TEXT NOT NULL,
    "create_at" TIMESTAMP(6),
    "degree_id" TEXT,
    "course_cluster_id" TEXT,

    CONSTRAINT "degree_course_cluster_link_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "student" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(6),
    "role" VARCHAR,
    "username" VARCHAR,
    "password" VARCHAR,
    "college_of" VARCHAR,
    "degree_id" TEXT,

    CONSTRAINT "student_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "course_cluster_link" ADD CONSTRAINT "course_cluster_link_course_cluster_id_fkey" FOREIGN KEY ("course_cluster_id") REFERENCES "course_cluster"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "course_cluster_link" ADD CONSTRAINT "course_cluster_link_course_id_fkey" FOREIGN KEY ("course_id") REFERENCES "course"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "course_prerequisite" ADD CONSTRAINT "course_prerequisite_course_id_fkey" FOREIGN KEY ("course_id") REFERENCES "course"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "course_prerequisite" ADD CONSTRAINT "course_prerequisite_prerequisite_course_id_fkey" FOREIGN KEY ("prerequisite_course_id") REFERENCES "course"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "coursees_taken" ADD CONSTRAINT "coursees_taken_course_id_fkey" FOREIGN KEY ("course_id") REFERENCES "course"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "coursees_taken" ADD CONSTRAINT "coursees_taken_student_id_fkey" FOREIGN KEY ("student_id") REFERENCES "student"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "degree_course_cluster_link" ADD CONSTRAINT "degree_course_cluster_link_course_cluster_id_fkey" FOREIGN KEY ("course_cluster_id") REFERENCES "course_cluster"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "degree_course_cluster_link" ADD CONSTRAINT "degree_course_cluster_link_degree_id_fkey" FOREIGN KEY ("degree_id") REFERENCES "degree"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "student" ADD CONSTRAINT "student_degree_id_fkey" FOREIGN KEY ("degree_id") REFERENCES "degree"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
