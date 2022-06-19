const express = require("express");
const Podlet = require("@podium/podlet");
const { resolve } = require("path");
const { name, version } = require("./package.json");

const port = 7400;
const app = express();

const allReviews = {
  porsche: ["So great", "Wonderful", "Works for me..."],
  fendt: ["Not my cup of tea..."],
  eicher: ["Just the best", "Give it a try!"],
};

const reviewsPodlet = new Podlet({
  name: `${name}-reviews`,
  version,
  pathname: "/",
  manifest: "/reviews.manifest.json",
  content: "/reviews",
  development: true,
});

reviewsPodlet.css({ value: "/reviews.css" });

app.use(reviewsPodlet.middleware());

app.use(express.static(resolve(__dirname, "public")));

app.get(reviewsPodlet.content(), (req, res) => {
  const { sku = "porsche" } = req.query;
  const reviews = allReviews[sku] || allReviews.porsche;
  res.status(200).podiumSend(`
    <div class="purple-reviews" id="reviews">
      <h3>Reviews</h3>
      ${reviews.map((review) => `<p>${review}</p>`).join("\n")}
    </div>
  `);
});

app.get(reviewsPodlet.manifest(), (req, res) => {
  res.status(200).json(reviewsPodlet);
});

app.listen(port, () => {
  console.log(`Listening on http://localhost:${port} ...`);
});
