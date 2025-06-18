# acme-widget-co
A Ruby implementation of Acme Widget Co's basket system with dynamic pricing, delivery rules, and special offers. Solution for a technical assessment.

## Ruby Version

This project requires **Ruby 2.7.6** or higher.

## Usage

### Product Class
Basic usage of the `Product` class:
```ruby
product = Product.new(name: "Book", code: "R01", price: 32.95)
```
### Delivery Rule Class
Basic usage of the `Delivery Rule` class:
```ruby
delivery_rule = DeliveryRule.new(min_price: 50, max_price: 90, cost: 2.95)
```

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
