import express from "express";
import {
  createEmployee,
  getAllEmployees,
} from "../controllers/employee.controller.ts";

const employeeRouter = express.Router();

employeeRouter.get("/all-employees", getAllEmployees);

employeeRouter.post("/create-employee", createEmployee);

export default employeeRouter;
