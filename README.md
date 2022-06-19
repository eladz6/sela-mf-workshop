# sela-mf-workshop

Repository for the workshop regarding Micro Frontends at Sela.

Structure:

- **demos**: Contains all the demos referenced in the theory parts.
- **exercises**: Contains information and boilerplate code to be used for doing the exercises.
- **slides**: Contains the slides used for the two days.
- **solutions**: Contains solution proposals for the different exercises.

Make sure to run `npm i` in each folder containing a *package.json*.

Some demos / examples / solutions have a *run-all.sh* file. This works in WSL, Linux, and MacOS. Running the script via `./run-all.sh` will actually install and run everything necessary for the respective demo / example / solution.

## Agenda

### Day 1

9:00-10:15

* Introduction to Micro Frontends
* Scalability Considerations
* Domain Decomposition
* Web Approach

10:15-11:00

* Exercise

11:00-12:00

* Solution Discussion
* Server-Side Composition
* Technical vs Functional Modules
* UX Scaling

12:00-12:45

* Exercise

13:45-14:45

* Solution Discussion
* App Shell Model
* Client-Side Composition
* Web Components

14:45-15:30

* Exercise

15:30-16:00

* Solution Discussion
* Recap & Outlook

### Day 2

9:00-10:15

* Dependency Graphs
* Performance Considerations
* Import maps and SystemJS
* Webpack Module Federation

10:15-11:00

* Exercise

11:00-12:00

* Solution Discussion
* SPA Composition
* single-spa
* End-To-End Testing

12:00-12:45

* Exercise

13:45-14:45

* Solution Discussion
* Siteless UIs
* Piral
* Emulator Distribution

14:45-15:30

* Exercise

15:30-16:00

* Solution Discussion
* Recap & Conclusion

## Further Infos

### Reverse Proxy

* [Varnish](https://varnish-cache.org/)
* [Reverse Proxy using Varnish](https://blog.allegro.tech/2016/03/Managing-Frontend-in-the-microservices-architecture.html)
* [Micro Frontends - Reverse Proxy](https://medium.com/asurion-product-development/not-so-micro-frontends-building-a-reverse-proxy-f41ab5cde81c)
* [Nginx as Reverse Proxy](https://github.com/alan-nascimento/route-distributed-microfrontends)

## More Samples

In general the following links may be relevant:

* [Samples from "Art of Micro Frontends"](https://github.com/ArtOfMicrofrontends)
* [Samples for Piral](https://github.com/piral-samples)
* [Samples for Module Federation](https://github.com/module-federation/module-federation-examples)

## License

All sample code is released using the MIT license. For more information see the [license file](./LICENSE).
