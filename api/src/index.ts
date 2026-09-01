import express from "express";
import cookieParser from "cookie-parser";
import cors from "cors";
import { authRouter } from "./routes/auth";
import { vehiclesRouter } from "./routes/vehicles";

const app = express();

app.use(
  cors({
    origin: process.env.WEB_ORIGIN ?? "http://localhost:3000",
    credentials: true,
  })
);
app.use(express.json());
app.use(cookieParser());

app.get("/health", (_req, res) => res.json({ ok: true }));

app.use("/auth", authRouter);
app.use("/vehicles", vehiclesRouter);

const port = process.env.PORT ?? 3001;
app.listen(port, () => {
  console.log(`Lashibi OS API listening on :${port}`);
});
