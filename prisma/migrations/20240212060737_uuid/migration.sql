/*
  Warnings:

  - The primary key for the `course_cluster_link` table will be changed. If it partially fails, the table could be left without primary key constraint.

*/
-- AlterTable
ALTER TABLE "course_cluster_link" DROP CONSTRAINT "course_cluster_link_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ADD CONSTRAINT "course_cluster_link_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "course_cluster_link_id_seq";
