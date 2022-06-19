# Solution for Exercise 2

The code for the `purple-podlet` was added.

Crucial parts here:

1. Adding some mock data

```js
const allReviews = {
  porsche: ["So great", "Wonderful", "Works for me..."],
  fendt: ["Not my cup of tea..."],
  eicher: ["Just the best", "Give it a try!"],
};
```

(model could be much more sophisticated than string)

2. Adding the podlet definition

```js
const reviewsPodlet = new Podlet({
  name: `${name}-reviews`,
  version,
  pathname: "/",
  manifest: "/reviews.manifest.json",
  content: "/reviews",
  development: true,
});
```

3. Returning the content code

```js
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
```

4. To have it properly designed a bit of CSS was added (optional)

```css
.purple-reviews {
  display: block;
  outline: 3px dashed purple;
  width: 100%;
}

#reviews {
  grid-area: reviews;
}
```

5. On the integration the `app` has to be changed to include

```js
const purpleReviews = layout.client.register({
  name: "purple-reviews",
  uri: "http://localhost:7400/reviews.manifest.json",
});
```

with the `purpleReviews` being used in the layouting part

```js
const [page, buyButton, cartButton, recommendations, reviews] =
await Promise.all([
  redPage.fetch(incoming, opts),
  blueBuy.fetch(incoming, opts),
  blueCart.fetch(incoming, opts),
  greenRecommendations.fetch(incoming, opts),
  purpleReviews.fetch(incoming, opts),
]);

incoming.podlets = [page, buyButton, cartButton, recommendations, reviews];

res.podiumSend(`
<div id="app">
  <h1 id="store">The Model Store</h1>
  ${cartButton.content}
  ${page.content}
  ${reviews.content}
  ${buyButton.content}
  ${recommendations.content}
</div>
`);
```

Also the CSS has been enhanced to include the `reviews` area:

```css
@media only screen and (max-width: 999px) {
  #app {
    grid-template-areas:
      "store basket"
      "image name"
      "image options"
      "image buy"
      "image reviews"
      "reco reco";
    grid-template-columns: 4fr 3fr;
  }
}

@media only screen and (min-width: 1000px) {
  #app {
    grid-template-areas:
      "store basket  reco"
      "image name    reco"
      "image options reco"
      "image buy     reco"
      "image reviews reco";
    grid-template-columns: 4fr 3fr 200px;
    width: 1000px;
  }
}
```

The podlet can be debugged by attaching a Node.js debugger to it. Running it, e.g., with `--inspect` will rely the port - we can then access it in a Chrome browser to set breakpoints etc.

For instance running:

```sh
node --inspect index.js
```
