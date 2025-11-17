/*
  Warnings:

  - You are about to drop the column `personalInformationId` on the `Employee` table. All the data in the column will be lost.
  - You are about to drop the `BankInformation` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `EmployeePersonalInformation` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[officeEmail]` on the table `Employee` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[personalEmail]` on the table `Employee` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `accountNumber` to the `Employee` table without a default value. This is not possible if the table is not empty.
  - Added the required column `bankName` to the `Employee` table without a default value. This is not possible if the table is not empty.
  - Added the required column `branchName` to the `Employee` table without a default value. This is not possible if the table is not empty.
  - Added the required column `currentDesignation` to the `Employee` table without a default value. This is not possible if the table is not empty.
  - Added the required column `disability` to the `Employee` table without a default value. This is not possible if the table is not empty.
  - Added the required column `employeeStatus` to the `Employee` table without a default value. This is not possible if the table is not empty.
  - Added the required column `employeeType` to the `Employee` table without a default value. This is not possible if the table is not empty.
  - Added the required column `fullName` to the `Employee` table without a default value. This is not possible if the table is not empty.
  - Added the required column `gender` to the `Employee` table without a default value. This is not possible if the table is not empty.
  - Added the required column `imageUrl` to the `Employee` table without a default value. This is not possible if the table is not empty.
  - Added the required column `joiningDesignation` to the `Employee` table without a default value. This is not possible if the table is not empty.
  - Added the required column `nationality` to the `Employee` table without a default value. This is not possible if the table is not empty.
  - Added the required column `officeEmail` to the `Employee` table without a default value. This is not possible if the table is not empty.
  - Added the required column `officeNumber` to the `Employee` table without a default value. This is not possible if the table is not empty.
  - Added the required column `personalEmail` to the `Employee` table without a default value. This is not possible if the table is not empty.
  - Added the required column `personalNumber` to the `Employee` table without a default value. This is not possible if the table is not empty.
  - Added the required column `religion` to the `Employee` table without a default value. This is not possible if the table is not empty.
  - Added the required column `spouseInformationId` to the `Employee` table without a default value. This is not possible if the table is not empty.
  - Added the required column `walletNumber` to the `Employee` table without a default value. This is not possible if the table is not empty.
  - Added the required column `walletType` to the `Employee` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Employee" DROP CONSTRAINT "Employee_personalInformationId_fkey";

-- DropIndex
DROP INDEX "Employee_personalInformationId_key";

-- AlterTable
ALTER TABLE "Employee" DROP COLUMN "personalInformationId",
ADD COLUMN     "accountNumber" TEXT NOT NULL,
ADD COLUMN     "bankName" TEXT NOT NULL,
ADD COLUMN     "branchName" TEXT NOT NULL,
ADD COLUMN     "currentDesignation" TEXT NOT NULL,
ADD COLUMN     "dateOfBirth" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "dateOfConfirmation" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "dateofRegularity" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "disability" BOOLEAN NOT NULL,
ADD COLUMN     "eTIN" TEXT DEFAULT 'n/a',
ADD COLUMN     "employeeStatus" TEXT NOT NULL,
ADD COLUMN     "employeeType" TEXT NOT NULL,
ADD COLUMN     "fatherName" TEXT DEFAULT 'n/a',
ADD COLUMN     "fullName" TEXT NOT NULL,
ADD COLUMN     "gender" "Gender" NOT NULL,
ADD COLUMN     "imageUrl" TEXT NOT NULL,
ADD COLUMN     "joiningDesignation" TEXT NOT NULL,
ADD COLUMN     "maritalStatus" "MaritalStatus" DEFAULT 'Single',
ADD COLUMN     "motherName" TEXT DEFAULT 'n/a',
ADD COLUMN     "nationalId" TEXT DEFAULT 'n/a',
ADD COLUMN     "nationality" TEXT NOT NULL,
ADD COLUMN     "officeEmail" TEXT NOT NULL,
ADD COLUMN     "officeNumber" TEXT NOT NULL,
ADD COLUMN     "personalEmail" TEXT NOT NULL,
ADD COLUMN     "personalNumber" TEXT NOT NULL,
ADD COLUMN     "placeOfBirth" TEXT DEFAULT 'n/a',
ADD COLUMN     "prlDate" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "program" TEXT DEFAULT 'n/a',
ADD COLUMN     "religion" TEXT NOT NULL,
ADD COLUMN     "spouseInformationId" UUID NOT NULL,
ADD COLUMN     "unit" TEXT DEFAULT 'n/a',
ADD COLUMN     "walletNumber" TEXT NOT NULL,
ADD COLUMN     "walletType" TEXT NOT NULL;

-- DropTable
DROP TABLE "BankInformation";

-- DropTable
DROP TABLE "EmployeePersonalInformation";

-- CreateIndex
CREATE UNIQUE INDEX "Employee_officeEmail_key" ON "Employee"("officeEmail");

-- CreateIndex
CREATE UNIQUE INDEX "Employee_personalEmail_key" ON "Employee"("personalEmail");

-- AddForeignKey
ALTER TABLE "Employee" ADD CONSTRAINT "Employee_spouseInformationId_fkey" FOREIGN KEY ("spouseInformationId") REFERENCES "SpouseInformation"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
