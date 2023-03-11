import express from "express";
import payload from "payload";
import nodemailer from "nodemailer";

require("dotenv").config();
const PORT = process.env.PORT || 3000;
const app = express();
app.enable('trust proxy')

// Redirect root to Admin panel
app.get("/", (_, res) => {
  res.redirect("/admin");
});

const start = async () => {
  const transport = await nodemailer.createTransport({
    host: process.env.SMTP_HOST,
    port:  465,
    auth: {
      user: process.env.SMTP_USER,
      pass: process.env.SMTP_PASS,
    },
  });
  // Initialize Payload
  await payload.init({
    secret: process.env.PAYLOAD_SECRET,
    mongoURL: process.env.MONGODB_URI,
    express: app,
    email: {
      fromName: "Admin",
      fromAddress: "umeshgote@kuberinvestors.com",
      transport,
    },
    onInit: async () => {
      payload.logger.info(`Payload Admin URL: ${payload.getAdminURL()}`);
    },
  });

  // Add your own express routes here

  app.listen(PORT);
};

start();
