import type { Request, Response } from "express";
import prismaClient from "../db/prisma.ts";
import type { Employee } from "../lib/types/types.ts";

export const getAllEmployees = async (req: Request, res: Response) => {
  try {
    const employees = await prismaClient.employee.findMany({});

    return res.status(200).json({
      success: true,
      message: "Fetched all employees.",
      data: employees,
    });
  } catch (error) {
    return res.status(400).json({
      success: false,
      message: "Error in fetching all employees",
      data: [],
    });
  }
};

export const createEmployee = async (req: Request, res: Response) => {
  try {
    const createdEmployee: Employee = await prismaClient.employee.create({
      data: {
        ...req.body,
        presentAddress: {
          create: {
            ...req.body.presentAddress,
          },
        },
        permanentAddress: {
          create: {
            ...req.body.permanentAddress,
          },
        },
        spouseInformation: {
          create: {
            ...req.body.spouseInformation,
          },
        },
      },
    });

    return res.status(200).json({
      success: true,
      message: "Created Employee.",
      data: createdEmployee,
    });
  } catch (error) {
    console.log(error);
    return res.status(400).json({
      success: false,
      message: "Error in fetching all employees",
      data: {},
    });
  }
};
