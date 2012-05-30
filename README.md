## The New Heat Clinic Archetype / Demo Project

For now, this requires the develop branch of the BroadleafCommerce project.

> NOTE: Do not expect that the existing controllers will work. They almost certainly will not.

### General Strategy

For now, the homepage is being rendered by the `DefaultController` in this project. When we ship, we will not have any controllers in this project; they will all be in the actual framework. However, it is easy to test things in Thymeleaf quickly for now. The project uses [Thymeleaf](http://www.thymeleaf.org/), and it's worth going through their [introductory documentation](http://www.thymeleaf.org/doc/Tutorial%20-%20Using%20Thymeleaf%2020120517.pdf) and their [Spring documentation](http://www.thymeleaf.org/doc/Tutorial%20-%20Thymeleaf%20+%20Spring%203%2020120517.pdf) before trying to dig in.

### Taglibs vs. Dialects and Processors

We will keep a similar strategy of using "taglibs" for complex functionality in the view layer. The .tld file is comparable to the `Dialect` and the individual tags are `Processors`. These are located in the Broadleaf project in the `broadleaf-framework-web` module in the `org.broadleafcommerce.core.web.dialect.*` packages. Here is a basic outline of the steps required to add one:

1. Add a dialect if you need a new one (the `blc-catalog` dialect has been added already... we may need other ones, like content or customer).

    a. Create the Dialect class (follow the catalog example)

    b. Add the Dialect to the available list (`applicationContext-servlet.xml`)

2. Add a processor that subclasses the proper AbstractProcessor. See `CategoriesProcessor` or the Thymeleaf documentation for more examples)

3. Register the processor in the Dialect class

### URL Handling

Thymeleaf does a pretty good job of figuring out what you need URLs to be when you use the `@{...}` notation. Check out index.html to see a couple of examples and how the render in the browser.
