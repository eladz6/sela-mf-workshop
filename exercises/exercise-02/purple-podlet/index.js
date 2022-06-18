const express = require("express");
const { resolve } = require("path");

const port = 7400;
const app = express();

app.use(express.static(resolve(__dirname, "public")));

app.listen(port, () => {
  console.log(`Listening on http://localhost:${port} ...`);
});
