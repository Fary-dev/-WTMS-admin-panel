/** @format */

require("dotenv").config(); // Lädt Umgebungsvariablen aus der .env-Datei
const express = require("express");
const cors = require("cors");
const path = require("path");
const morgan = require("morgan"); // Für Logging von  HTTP-Anfragen

const userRoutes = require("./routes/user");
const fileRoutes = require("./routes/file");
const categoryRoutes = require("./routes/category");
const productRoutes = require("./routes/product");
const allergieRoutes = require("./routes/allergie");
const ingredientRoutes = require("./routes/ingredient");

const app = express();
const port = process.env.PORT || 4000;

// Middleware
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(morgan(process.env.LOG_LEVEL || "dev")); // Logging

// Test-Endpoint
app.get("/message", (req, res) => {
  res.json({ message: "Server läuft einwandfrei!" });
});

app.use("/user", userRoutes);
app.use("/upload", fileRoutes);
app.use("/category", categoryRoutes);
app.use("/product", productRoutes);
app.use("/allergie", allergieRoutes);
app.use("/ingredient", ingredientRoutes);

// Datei-Vorschau-Endpoint
app.get("/preview/:name", (req, res) => {
  const filePath = path.join(__dirname, "./uploads/category/", req.params.name);
  res.sendFile(filePath, (err) => {
    if (err) {
      res.status(404).json({ message: "Datei nicht gefunden!" });
    }
  });
});

// Fehler-Handling
app.use((err, req, res, next) => {
  const statusCode = err.statusCode || 500;
  console.error("Fehler:", err.message); // Logge den Fehler
  res
    .status(statusCode)
    .json({ message: err.message || "Interner Serverfehler" });
});

app.listen(port, () => {
  console.log(`Server läuft auf: http://localhost:${port}`);
});
