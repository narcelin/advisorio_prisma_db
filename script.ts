import { PrismaClient } from '@prisma/client'

const prisma = new PrismaClient();

async function main() {
  // Retrieve all published posts
  const allPosts = await prisma.student.deleteMany();
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