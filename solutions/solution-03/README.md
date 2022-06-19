# Solution for Exercise 3

The code for the `purple` MF was added.

Crucial parts here:

1. Adding some mock data (like podlet)

```js
const allReviews = {
  porsche: ["So great", "Wonderful", "Works for me..."],
  fendt: ["Not my cup of tea..."],
  eicher: ["Just the best", "Give it a try!"],
};
```

(again, model could be much more sophisticated than string)

2. Rendering the content code

```js
render(sku) {
  const reviews = allReviews[sku] || allReviews.porsche;

  this.innerHTML = `
    <h3>Reviews</h3>
      ${reviews.map((review) => `<p>${review}</p>`).join("\n")}
    </div>`;
}
```

3. To have it properly designed a bit of CSS was added (optional)

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

4. On the integration the `app` has to be changed to include

```html
<script src="http://localhost:2004/product-reviews.js" type="module"></script>
```

with the CSS has been enhanced to include the `reviews` area:

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

5. The `red` MF needs to have the `purple` reference via the Web Component, too:

```js
<product-reviews sku="${sku}" class="purple-reviews" id="reviews"></product-reviews>
```

6. Most importantly, the `sku` attribute change in the page also needs to be forwarded to the children:

```js
attributeChangedCallback(name, oldValue, newValue) {
  if (name === "sku" && oldValue !== newValue) {
    // ...
    this.querySelector("#reviews").setAttribute("sku", newValue);
    // ...
  }
}
```

The MF can be debugged directly in the browser.
