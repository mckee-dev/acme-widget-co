# acme-widget-co
A Ruby implementation of Acme Widget Co's basket system with dynamic pricing, delivery rules, and special offers. Solution for a technical assessment.

## Ruby Version

This project requires **Ruby 2.7.6** or higher.

## Usage

### App Data
This module holds data for the some of the app's classes
### Product Class
This class handles product initialization, validation and related methods
### Delivery Rule Class
This class handles delivery rule initialization, validation, and its associated methods
### Offers Class
Base Offer Class serves as a base for all the offers, whereas Red Widget Offer class handles the specific discount logic as required
### Pricing Context Class
This class acts as a single interface for all the app data to be included in the basket
### Basket Class
This initialised with the product catalogue, delivery charge rules, and offers. It also contains relevant methods for adding items to the basket and returning the total cost of the basket.

## Assumptions

**Offer Application**

"Buy 1 red widget, get 2nd half price" applies to every 2nd unit

Example: 3 red widgets = 1 full discount (3/2 = 1 in integer division)

**Delivery Calculation**

Based on post-discount subtotal

**Rounding**

Monetary values rounded to 2 decimal places

## 🧪 Testing

This project uses [RSpec](https://rspec.info/) as the testing framework.

### 📦 Install RSpec

If you haven't already installed RSpec, you can do so with: `gem install rspec`

To run tests use this command: `rspec`

Or to run a specific test file use: `rspec path_to_the_test_file`

## 🧹 Code Style

We use [RuboCop](https://github.com/rubocop/rubocop) to maintain consistent code style in this project.

### ✅ Lint your code:

```bash
rubocop
```

To autocorrect rubocop offenses use this command: `rubocop -A`
