import express from "express";
import {
  createEmployee,
  getAllEmployees,
  getEmployeeById,
} from "../controllers/employee.controller.ts";

const employeeRouter = express.Router();

employeeRouter.get("/all-employees", getAllEmployees);

employeeRouter.post("/create-employee", createEmployee);

employeeRouter.get("/all-employees/:id", getEmployeeById);

export default employeeRouter;
