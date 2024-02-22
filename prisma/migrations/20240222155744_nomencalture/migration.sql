/*
  Warnings:

  - You are about to drop the `courseCluster` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `degree_courseCluster_junction` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "degree_courseCluster_junction" DROP CONSTRAINT "degree_courseCluster_junction_courseCluster_id_fkey";

-- DropForeignKey
ALTER TABLE "degree_courseCluster_junction" DROP CONSTRAINT "degree_courseCluster_junction_degree_id_fkey";

-- DropTable
DROP TABLE "courseCluster";

-- DropTable
DROP TABLE "degree_courseCluster_junction";

-- CreateTable
CREATE TABLE "degree_course_cluster_junction" (
    "id" TEXT NOT NULL,
    "create_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "degree_id" TEXT NOT NULL,
    "course_cluster_id" TEXT NOT NULL,

    CONSTRAINT "degree_course_cluster_junction_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "course_cluster" (
    "id" TEXT NOT NULL,
    "create_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "title" VARCHAR,
    "requirements" TEXT,

    CONSTRAINT "course_cluster_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "degree_course_cluster_junction" ADD CONSTRAINT "degree_course_cluster_junction_degree_id_fkey" FOREIGN KEY ("degree_id") REFERENCES "degree"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "degree_course_cluster_junction" ADD CONSTRAINT "degree_course_cluster_junction_course_cluster_id_fkey" FOREIGN KEY ("course_cluster_id") REFERENCES "course_cluster"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
