/*
  Warnings:

  - You are about to drop the column `course_cluster` on the `course` table. All the data in the column will be lost.
  - You are about to drop the `course_cluster_link` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `degree_course_cluster_link` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "course_cluster_link" DROP CONSTRAINT "course_cluster_link_course_cluster_id_fkey";

-- DropForeignKey
ALTER TABLE "course_cluster_link" DROP CONSTRAINT "course_cluster_link_course_id_fkey";

-- DropForeignKey
ALTER TABLE "degree_course_cluster_link" DROP CONSTRAINT "degree_course_cluster_link_course_cluster_id_fkey";

-- DropForeignKey
ALTER TABLE "degree_course_cluster_link" DROP CONSTRAINT "degree_course_cluster_link_degree_id_fkey";

-- AlterTable
ALTER TABLE "course" DROP COLUMN "course_cluster";

-- DropTable
DROP TABLE "course_cluster_link";

-- DropTable
DROP TABLE "degree_course_cluster_link";
