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

const degrees = [
    {
        title: 'Pre-Business',
    }
]

const degree_course_cluster_junctions = [
    {
        degree_id: 'b37a1b5d-8cc3-448e-9f50-3606c6884ad4',
        course_cluster_id: 'ad1488bc-329f-4ccd-b3bb-c680813d6def'
    },
    {
        degree_id: 'b37a1b5d-8cc3-448e-9f50-3606c6884ad4',
        course_cluster_id: 'd31aa6c4-fbcc-481e-9c42-1cb13b4dec02'
    },
    {
        degree_id: 'b37a1b5d-8cc3-448e-9f50-3606c6884ad4',
        course_cluster_id: '949dfa90-3a8d-4a52-9281-35c6d087f93a'
    },
    {
        degree_id: 'b37a1b5d-8cc3-448e-9f50-3606c6884ad4',
        course_cluster_id: '512ab221-00fd-4d14-9015-14bb76a45c66'
    },
]

const course_clusters = [
    {
        title: 'Foundations of Written Communications',
        requirements: '6 credit hours and a C or heigher'
    },
    {
        title: 'Foundations of Science & The Natural World',
        requirements: '6 credit hours and a C or heigher - One of the courses must have a lab. Students must take 2 of the following, 1st from group A and 2nd from group A or B'
    },
    {
        title: 'Foundations of Science & The Natural World Group A',
        requirements: '6 credit hours and a C or heigher'
    },
    {
        title: 'Foundations of Science & The Natural World Group B',
        requirements: '6 credit hours and a C or heigher'
    },
]

const courses = [
    {
        name: 'Math for Liberal Arts 1',
    },
    {
        name: 'Mather for Liberal Arts 2',
    },
    {
        name: 'College Algebra',
    },
    {
        name: 'Inntroductory Statistics',
    },
    {
        name: 'Calculus with Analytic Geometry 1',
    },
    {
        name: 'Computer Programming & Data Literacy for Everyone',
    },
    {
        name: 'Precalculus Algebra & Trigonometry',
    },
    {
        name: 'Intro Calculus w/Applications',
    },
    {
        name: 'Method of Calculus',
    },
    {
        name: 'Life Science Calculus 1',
    },
    {
        name: 'Calculus with Analytic Geometry',
    },
    {
        name: 'Logic',
    },
]

const courses_taken = [
    {
        student_id: 'b7813cbc-3238-45aa-8824-4423a6534517',
        course_id: '15a17b5c-861e-4255-a9ca-8b2b4b05e00f'
    }, {
        student_id: 'b7813cbc-3238-45aa-8824-4423a6534517',
        course_id: '218986b8-8684-408d-bd22-2dc459fd44a9'
    }
]

const course_prerequisites = [
    {
        course_id: '15a17b5c-861e-4255-a9ca-8b2b4b05e00f'
    }
]

async function main() {
    await prisma.degree_course_cluster_junction.createMany({
        data: degree_course_cluster_junctions
      })
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