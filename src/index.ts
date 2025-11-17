// src/index.ts
import express from "express";
import type { Express, Request, Response } from "express";
import dotenv from "dotenv";
import employeeRouter from "./routes/employee.route.ts";

dotenv.config();

const app: Express = express();
const port = process.env.PORT || 4000;

app.use(express.json());

app.get("/", async (req: Request, res: Response) => {
  res.send("Hello world");
});

app.use("/hr-management", employeeRouter);

app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});
