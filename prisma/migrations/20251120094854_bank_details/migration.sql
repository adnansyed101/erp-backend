/*
  Warnings:

  - You are about to drop the column `accountNumber` on the `AdditionalInformation` table. All the data in the column will be lost.
  - You are about to drop the column `bankName` on the `AdditionalInformation` table. All the data in the column will be lost.
  - You are about to drop the column `branchName` on the `AdditionalInformation` table. All the data in the column will be lost.
  - You are about to drop the column `walletNumber` on the `AdditionalInformation` table. All the data in the column will be lost.
  - You are about to drop the column `walletType` on the `AdditionalInformation` table. All the data in the column will be lost.
  - Added the required column `accountNumber` to the `Employee` table without a default value. This is not possible if the table is not empty.
  - Added the required column `bankName` to the `Employee` table without a default value. This is not possible if the table is not empty.
  - Added the required column `branchName` to the `Employee` table without a default value. This is not possible if the table is not empty.
  - Added the required column `walletNumber` to the `Employee` table without a default value. This is not possible if the table is not empty.
  - Added the required column `walletType` to the `Employee` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "AdditionalInformation" DROP COLUMN "accountNumber",
DROP COLUMN "bankName",
DROP COLUMN "branchName",
DROP COLUMN "walletNumber",
DROP COLUMN "walletType";

-- AlterTable
ALTER TABLE "Employee" ADD COLUMN     "accountNumber" TEXT NOT NULL,
ADD COLUMN     "bankName" TEXT NOT NULL,
ADD COLUMN     "branchName" TEXT NOT NULL,
ADD COLUMN     "walletNumber" TEXT NOT NULL,
ADD COLUMN     "walletType" TEXT NOT NULL;
