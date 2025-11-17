-- CreateEnum
CREATE TYPE "Gender" AS ENUM ('MALE', 'Female', 'Other');

-- CreateEnum
CREATE TYPE "MaritalStatus" AS ENUM ('Single', 'Married', 'Divorced', 'Widowed', 'Separated');

-- CreateTable
CREATE TABLE "EmployeePersonalInformation" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "fullName" TEXT NOT NULL,
    "imageUrl" TEXT NOT NULL,
    "officeEmail" TEXT NOT NULL,
    "personalEmail" TEXT NOT NULL,
    "personalNumber" TEXT NOT NULL,
    "officeNumber" TEXT NOT NULL,
    "employeeType" TEXT NOT NULL,
    "employeeStatus" TEXT NOT NULL,
    "nationality" TEXT NOT NULL,
    "disability" BOOLEAN NOT NULL,
    "gender" "Gender" NOT NULL,
    "religion" TEXT NOT NULL,
    "joiningDesignation" TEXT NOT NULL,
    "currentDesignation" TEXT NOT NULL,
    "dateOfBirth" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "dateOfConfirmation" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "fatherName" TEXT,
    "motherName" TEXT,
    "nationalId" TEXT,
    "placeOfBirth" TEXT,
    "maritalStatus" "MaritalStatus",
    "eTIN" TEXT,
    "program" TEXT,
    "unit" TEXT,
    "prlDate" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "dateofRegularity" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "createdAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "EmployeePersonalInformation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Address" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "division" TEXT NOT NULL,
    "district" TEXT NOT NULL,
    "upazilaOrThana" TEXT NOT NULL,
    "postOffice" TEXT NOT NULL,
    "postCode" TEXT NOT NULL,
    "block" TEXT NOT NULL,
    "houseNoOrVillage" TEXT NOT NULL,
    "roadNo" TEXT NOT NULL,
    "createdAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Address_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SpouseInformation" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "fullName" TEXT NOT NULL,
    "dateOfBirth" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "gender" TEXT NOT NULL,
    "occupation" TEXT NOT NULL,
    "nid" TEXT NOT NULL,
    "mobileNumber" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "createdAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "SpouseInformation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BankInformation" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "bankName" TEXT NOT NULL,
    "branchName" TEXT NOT NULL,
    "accountNumber" TEXT NOT NULL,
    "walletType" TEXT NOT NULL,
    "walletNumber" TEXT NOT NULL,
    "createdAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "BankInformation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Employee" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "employeePersonalInformationId" UUID,
    "presentAddressId" UUID NOT NULL,
    "permanentAddressId" UUID NOT NULL,

    CONSTRAINT "Employee_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "EmployeePersonalInformation_officeEmail_key" ON "EmployeePersonalInformation"("officeEmail");

-- CreateIndex
CREATE UNIQUE INDEX "EmployeePersonalInformation_personalEmail_key" ON "EmployeePersonalInformation"("personalEmail");

-- CreateIndex
CREATE UNIQUE INDEX "SpouseInformation_email_key" ON "SpouseInformation"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Employee_employeePersonalInformationId_key" ON "Employee"("employeePersonalInformationId");

-- CreateIndex
CREATE UNIQUE INDEX "Employee_presentAddressId_key" ON "Employee"("presentAddressId");

-- CreateIndex
CREATE UNIQUE INDEX "Employee_permanentAddressId_key" ON "Employee"("permanentAddressId");

-- AddForeignKey
ALTER TABLE "Employee" ADD CONSTRAINT "Employee_employeePersonalInformationId_fkey" FOREIGN KEY ("employeePersonalInformationId") REFERENCES "EmployeePersonalInformation"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Employee" ADD CONSTRAINT "Employee_presentAddressId_fkey" FOREIGN KEY ("presentAddressId") REFERENCES "Address"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Employee" ADD CONSTRAINT "Employee_permanentAddressId_fkey" FOREIGN KEY ("permanentAddressId") REFERENCES "Address"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
