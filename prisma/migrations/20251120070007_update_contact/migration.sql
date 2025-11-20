/*
  Warnings:

  - The values [MALE] on the enum `Gender` will be removed. If these variants are still used in the database, this will fail.

*/
-- AlterEnum
BEGIN;
CREATE TYPE "Gender_new" AS ENUM ('Male', 'Female', 'Other');
ALTER TABLE "Employee" ALTER COLUMN "gender" TYPE "Gender_new" USING ("gender"::text::"Gender_new");
ALTER TYPE "Gender" RENAME TO "Gender_old";
ALTER TYPE "Gender_new" RENAME TO "Gender";
DROP TYPE "public"."Gender_old";
COMMIT;

-- DropIndex
DROP INDEX "ContactInformation_email_key";

-- AlterTable
ALTER TABLE "Address" ALTER COLUMN "roadNo" SET DEFAULT 'n/a';

-- AlterTable
ALTER TABLE "ContactInformation" ALTER COLUMN "fullName" SET DEFAULT 'n/a',
ALTER COLUMN "gender" SET DEFAULT 'n/a',
ALTER COLUMN "occupation" SET DEFAULT 'n/a',
ALTER COLUMN "nid" SET DEFAULT 'n/a',
ALTER COLUMN "mobileNumber" SET DEFAULT 'n/a',
ALTER COLUMN "email" SET DEFAULT 'n/a';

-- AlterTable
ALTER TABLE "Employee" ALTER COLUMN "spouseInformationId" DROP NOT NULL;
