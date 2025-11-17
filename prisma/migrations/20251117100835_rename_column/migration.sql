/*
  Warnings:

  - You are about to drop the column `employeePersonalInformationId` on the `Employee` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[personalInformationId]` on the table `Employee` will be added. If there are existing duplicate values, this will fail.

*/
-- DropForeignKey
ALTER TABLE "Employee" DROP CONSTRAINT "Employee_employeePersonalInformationId_fkey";

-- DropIndex
DROP INDEX "Employee_employeePersonalInformationId_key";

-- AlterTable
ALTER TABLE "Employee" DROP COLUMN "employeePersonalInformationId",
ADD COLUMN     "personalInformationId" UUID;

-- CreateIndex
CREATE UNIQUE INDEX "Employee_personalInformationId_key" ON "Employee"("personalInformationId");

-- AddForeignKey
ALTER TABLE "Employee" ADD CONSTRAINT "Employee_personalInformationId_fkey" FOREIGN KEY ("personalInformationId") REFERENCES "EmployeePersonalInformation"("id") ON DELETE SET NULL ON UPDATE CASCADE;
