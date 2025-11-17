import type { Request, Response } from "express";
import prismaClient from "../db/prisma.ts";

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
