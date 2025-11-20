/*
  Warnings:

  - You are about to drop the column `accountNumber` on the `Employee` table. All the data in the column will be lost.
  - You are about to drop the column `bankName` on the `Employee` table. All the data in the column will be lost.
  - You are about to drop the column `branchName` on the `Employee` table. All the data in the column will be lost.
  - You are about to drop the column `dateofRegularity` on the `Employee` table. All the data in the column will be lost.
  - You are about to drop the column `eTIN` on the `Employee` table. All the data in the column will be lost.
  - You are about to drop the column `fatherName` on the `Employee` table. All the data in the column will be lost.
  - You are about to drop the column `maritalStatus` on the `Employee` table. All the data in the column will be lost.
  - You are about to drop the column `motherName` on the `Employee` table. All the data in the column will be lost.
  - You are about to drop the column `nationalId` on the `Employee` table. All the data in the column will be lost.
  - You are about to drop the column `placeOfBirth` on the `Employee` table. All the data in the column will be lost.
  - You are about to drop the column `prlDate` on the `Employee` table. All the data in the column will be lost.
  - You are about to drop the column `program` on the `Employee` table. All the data in the column will be lost.
  - You are about to drop the column `unit` on the `Employee` table. All the data in the column will be lost.
  - You are about to drop the column `walletNumber` on the `Employee` table. All the data in the column will be lost.
  - You are about to drop the column `walletType` on the `Employee` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[addtionalInformationId]` on the table `Employee` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `addtionalInformationId` to the `Employee` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Employee" DROP COLUMN "accountNumber",
DROP COLUMN "bankName",
DROP COLUMN "branchName",
DROP COLUMN "dateofRegularity",
DROP COLUMN "eTIN",
DROP COLUMN "fatherName",
DROP COLUMN "maritalStatus",
DROP COLUMN "motherName",
DROP COLUMN "nationalId",
DROP COLUMN "placeOfBirth",
DROP COLUMN "prlDate",
DROP COLUMN "program",
DROP COLUMN "unit",
DROP COLUMN "walletNumber",
DROP COLUMN "walletType",
ADD COLUMN     "addtionalInformationId" TEXT NOT NULL,
ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP;

-- CreateTable
CREATE TABLE "AdditionalInformation" (
    "id" TEXT NOT NULL,
    "fatherName" TEXT DEFAULT 'n/a',
    "motherName" TEXT DEFAULT 'n/a',
    "nationalId" TEXT DEFAULT 'n/a',
    "placeOfBirth" TEXT DEFAULT 'n/a',
    "maritalStatus" "MaritalStatus" DEFAULT 'Single',
    "eTIN" TEXT DEFAULT 'n/a',
    "program" TEXT DEFAULT 'n/a',
    "unit" TEXT DEFAULT 'n/a',
    "bankName" TEXT NOT NULL,
    "branchName" TEXT NOT NULL,
    "accountNumber" TEXT NOT NULL,
    "walletType" TEXT NOT NULL,
    "walletNumber" TEXT NOT NULL,
    "prlDate" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "dateofRegularity" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "AdditionalInformation_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Employee_addtionalInformationId_key" ON "Employee"("addtionalInformationId");

-- AddForeignKey
ALTER TABLE "Employee" ADD CONSTRAINT "Employee_addtionalInformationId_fkey" FOREIGN KEY ("addtionalInformationId") REFERENCES "AdditionalInformation"("id") ON DELETE CASCADE ON UPDATE CASCADE;
