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

const course_clusters = [
    {
        title: 'Foundations of Written Communications',
        requirements: '6 credit hours and a C or heigher'
    },
    {
        title: 'Foundations of Written Communications',
        requirements: '6 credit hours and a C or heigher'
    },
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

const course_prerequisites = [
    {
        course_id: '15a17b5c-861e-4255-a9ca-8b2b4b05e00f'
    }
]

async function main() {
        await prisma.course_cluster_link.createMany({
            data:    [{
                course_id: '689c722e-1c46-4330-8276-8084e61225c4'
            },{
                course_id: 'b18e54de-1d24-4929-b419-eaef23ab1deb'
            }]
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