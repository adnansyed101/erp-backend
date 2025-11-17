import express from "express";
import { getAllEmployees } from "../controllers/employee.controller.ts";

const employeeRouter = express.Router();

employeeRouter.get("/all-employees", getAllEmployees);

export default employeeRouter;
