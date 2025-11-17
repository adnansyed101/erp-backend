import z from "zod";
import { EmployeeSchema } from "../validators/employee.validator.ts";

export type Employee = z.infer<typeof EmployeeSchema>;
