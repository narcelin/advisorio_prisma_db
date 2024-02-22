/*
  Warnings:

  - You are about to drop the `course_cluster` table. If the table is not empty, all the data it contains will be lost.

*/
-- AlterTable
ALTER TABLE "courses_taken" ADD COLUMN     "grade" INTEGER;

-- DropTable
DROP TABLE "course_cluster";

-- CreateTable
CREATE TABLE "degree_courseCluster_junction" (
    "id" TEXT NOT NULL,
    "create_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "degree_id" TEXT NOT NULL,
    "courseCluster_id" TEXT NOT NULL,

    CONSTRAINT "degree_courseCluster_junction_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "courseCluster" (
    "id" TEXT NOT NULL,
    "create_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "title" VARCHAR,
    "requirements" TEXT,

    CONSTRAINT "courseCluster_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "degree_courseCluster_junction" ADD CONSTRAINT "degree_courseCluster_junction_degree_id_fkey" FOREIGN KEY ("degree_id") REFERENCES "degree"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "degree_courseCluster_junction" ADD CONSTRAINT "degree_courseCluster_junction_courseCluster_id_fkey" FOREIGN KEY ("courseCluster_id") REFERENCES "courseCluster"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
