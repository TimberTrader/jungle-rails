## Jungle on Rails

This represents my fourth project (third solo project) for the LhL Web Dev Bootcamp (Winter 2019).

Within the one week provided by LhL’s curriculum I was able to add new features and fix identified bugs to an existing code base in a language (Ruby) and framework (Rails) where I had no previous experience.

### The App
Jungle On Rails simulates an on-line retail application which would allow shoppers:

* to browse a catalogue displaying item image, name, description, price & an overall product rating determined by individual reviews;
* by passing through to an item specific page they can view a collection of individual ratings and reviews.
* add items to a shopping cart and create an order by providing a credit card for payment processing (simulated);
* to register for their own account allowing them to add reviews and rate products in the catalogue.

This application also allows the store administrator to add new products and categories.

### The Project

The purpose of this project was to simulate the real world where feature and bug-fix requests are provided without step-by-step instructions. Within the one week given to complete this project I was able to …

  … learn to use Ruby and the Rails framework (with no prior experience with this specific paradigm, language and framework) while …
  … navigating an existing code-base to implement new features in unfamiliar territory and in the code style provided all the while being cognizant of the limitations of the legacy code (Ruby 2.3 & Rails 4.2) … 
  … by applying previous learning tactics to create workable solutions using Ruby / Rails, BCrypt (for password hashing), Ethereal mail (for email notification testing), Stripe (to simulate credit card processing) and a postgres database.

### New Features
The following features were implemented within the week provided:

* created a new rating and review system which displays to all shoppers (registered or not) overall ratings in the catalogue and individual reviews and ratings in the product details;
* created the ability for customers to create an account and to use the account to rate and review products;
* allow admins to create new product categories and apply them in creating new products and secure admin functions through HTTP authorization through username/password;
* enhance the order process to provide customers order details on a confirmation page and notification of same via email;
* display a sold out badge in the catalogue when the database showed no inventory;
* bug fixes.

### Getting started
1.	Fork & Clone
2.	Run bundle install to install dependencies
3.	Run bin/rake db:reset to create, load and seed db
4.	Change .env file for admin user/password
5.	Run bin/rails s -b 0.0.0.0 to start the server
Stripe Testing
Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.
More information in their docs: https://stripe.com/docs/testing#cards

### Dependencies
  bcrypt (~> 3.1.7)
  bootstrap-sass (~> 3.3.6)
  byebug
  carrierwave
  dotenv-rails
  faker
  font-awesome-rails
  jbuilder (~> 2.0)
  jquery-rails
  money-rails
  newrelic_rpm
  pg
  puma
  quiet_assets
  rails (= 4.2.6)
  rails_12factor
  rmagick
  sass-rails (~> 5.0)
  sdoc (~> 0.4.0)
  spring
  stripe
  turbolinks
  uglifier (>= 1.3.0)
  web-console (~> 2.0)

RUBY VERSION
   ruby 2.3.5p376

BUNDLED WITH
   1.16.1
