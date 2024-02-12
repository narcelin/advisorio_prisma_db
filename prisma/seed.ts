//npx prisma db seed --preview-feature

import { PrismaClient, Prisma } from '@prisma/client'

const prisma = new PrismaClient()


const students = [
    {
        role: 'BASIC',
        username: 'username',
        firstName: 'firstName',
        lastName: 'lastName',
        password: 'password',
        college_of: 'Business'
    }
]

const courses = [
    {
        name: 'College Writting I',
        
        
    }
]

const course_clusters = [
    {
        title: 'Foundations of Written Communications',
        requirements: '6 credit hours and a C or heigher'
    }
]

const course_cluster_links = [
    {
        course_id: '15a17b5c-861e-4255-a9ca-8b2b4b05e00f'
    }
]

const courses_taken_ = [
    {
        student_id: 'b7813cbc-3238-45aa-8824-4423a6534517'
    }
]

const degrees = [
    {
        title: 'Pre-Business',
    }
]

const degree_course_cluster_links = [
    {
        degree_id: 'b37a1b5d-8cc3-448e-9f50-3606c6884ad4',
    }
]

async function main() {
    for(const degree_course_cluster_link of degree_course_cluster_links){
        await prisma.degree_course_cluster_link.create({
            data: degree_course_cluster_link
        })
    }
}

main()
  .then(async () => {
    await prisma.$disconnect()
  })
  .catch(async (e) => {
    console.error(e)
    await prisma.$disconnect()
    process.exit(1)
  })