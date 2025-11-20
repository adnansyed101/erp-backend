/*
  Warnings:

  - You are about to drop the `SpouseInformation` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[spouseInformationId]` on the table `Employee` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[emergencyContactId]` on the table `Employee` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `emergencyContactId` to the `Employee` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Employee" DROP CONSTRAINT "Employee_spouseInformationId_fkey";

-- AlterTable
ALTER TABLE "Employee" ADD COLUMN     "emergencyContactId" UUID NOT NULL;

-- DropTable
DROP TABLE "SpouseInformation";

-- CreateTable
CREATE TABLE "ContactInformation" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "fullName" TEXT NOT NULL,
    "dateOfBirth" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "gender" TEXT NOT NULL,
    "occupation" TEXT NOT NULL,
    "nid" TEXT NOT NULL,
    "mobileNumber" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "createdAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "ContactInformation_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "ContactInformation_email_key" ON "ContactInformation"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Employee_spouseInformationId_key" ON "Employee"("spouseInformationId");

-- CreateIndex
CREATE UNIQUE INDEX "Employee_emergencyContactId_key" ON "Employee"("emergencyContactId");

-- AddForeignKey
ALTER TABLE "Employee" ADD CONSTRAINT "Employee_spouseInformationId_fkey" FOREIGN KEY ("spouseInformationId") REFERENCES "ContactInformation"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Employee" ADD CONSTRAINT "Employee_emergencyContactId_fkey" FOREIGN KEY ("emergencyContactId") REFERENCES "ContactInformation"("id") ON DELETE CASCADE ON UPDATE CASCADE;
