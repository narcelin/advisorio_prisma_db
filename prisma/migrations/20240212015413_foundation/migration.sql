/*
  Warnings:

  - You are about to drop the `Post` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `User` table. If the table is not empty, all the data it contains will be lost.

*/
-- CreateEnum
CREATE TYPE "Role" AS ENUM ('BASIC', 'ADMIN', 'ADVISOR');

-- DropForeignKey
ALTER TABLE "Post" DROP CONSTRAINT "Post_authorId_fkey";

-- DropTable
DROP TABLE "Post";

-- DropTable
DROP TABLE "User";

-- CreateTable
CREATE TABLE "Course" (
    "id" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "teacher" TEXT NOT NULL,
    "specialRequirements" BOOLEAN NOT NULL,

    CONSTRAINT "Course_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CoursePrerequisites" (
    "id" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "courseId" TEXT NOT NULL,
    "courseId_Prereq" TEXT NOT NULL,

    CONSTRAINT "CoursePrerequisites_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CoursesBlock" (
    "id" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "groupRequirements" JSONB NOT NULL,
    "groupCourseId" TEXT NOT NULL,
    "courseId" TEXT NOT NULL,
    "degreeId" TEXT NOT NULL,

    CONSTRAINT "CoursesBlock_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CoursesTaken" (
    "id" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "courseId" TEXT NOT NULL,
    "studentId" TEXT NOT NULL,

    CONSTRAINT "CoursesTaken_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Degree" (
    "id" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT,

    CONSTRAINT "Degree_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Student" (
    "id" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "role" "Role" NOT NULL DEFAULT 'BASIC',
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "firstName" TEXT,
    "lastName" TEXT,
    "age" INTEGER,
    "email" TEXT NOT NULL,
    "collegeOf" TEXT NOT NULL,
    "degreesAchived" JSONB,
    "degreeId" TEXT NOT NULL,

    CONSTRAINT "Student_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Student_email_key" ON "Student"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Student_degreeId_key" ON "Student"("degreeId");

-- AddForeignKey
ALTER TABLE "CoursePrerequisites" ADD CONSTRAINT "CoursePrerequisites_courseId_Prereq_fkey" FOREIGN KEY ("courseId_Prereq") REFERENCES "Course"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CoursePrerequisites" ADD CONSTRAINT "CoursePrerequisites_courseId_fkey" FOREIGN KEY ("courseId") REFERENCES "Course"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CoursesBlock" ADD CONSTRAINT "CoursesBlock_courseId_fkey" FOREIGN KEY ("courseId") REFERENCES "Course"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CoursesBlock" ADD CONSTRAINT "CoursesBlock_degreeId_fkey" FOREIGN KEY ("degreeId") REFERENCES "Degree"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CoursesTaken" ADD CONSTRAINT "CoursesTaken_courseId_fkey" FOREIGN KEY ("courseId") REFERENCES "Course"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CoursesTaken" ADD CONSTRAINT "CoursesTaken_studentId_fkey" FOREIGN KEY ("studentId") REFERENCES "Student"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Student" ADD CONSTRAINT "Student_degreeId_fkey" FOREIGN KEY ("degreeId") REFERENCES "Degree"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
