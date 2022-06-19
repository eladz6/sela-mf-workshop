# Solution for Exercise 1

See [drawio diagram](./netflix.drawio) for a potential solution.

Answers:

* We have four teams:
  1. Team responsible for the user subdomain (mostly dealing with the user account / personal information / and the user's profiles)
  2. Team responsible for the catalogue subdomain (mostly dealing with available movies, their relations, ...)
  3. Team responsible for the movies subdomain (mostly dealing with preview images, DRM, and showing of movies / player)
  4. Team responsible for the analytics subdomain (mostly dealing with gathered data)

* The teams have 0 to many micro frontends (e.g., analytics would either have no micro frontend or a micro frontend that will not show up in the UI, but just gather data)
* Potential micro frontends and their components can be seen in the example application at https://netflix-demo.samples.piral.cloud/browse (how it works / what is behind this example will be explained on day 2)
