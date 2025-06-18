# frozen_string_literal: true

# This module holds data for the some of the project's classes
module Data
  def self.products
    [
      Product.new(name: 'Red Widget', code: 'R01', price: 32.95),
      Product.new(name: 'Green Widget', code: 'G01', price: 24.95),
      Product.new(name: 'Blue Widget', code: 'B01', price: 7.95)
    ]
  end

  def self.delivery_rules
    [
      DeliveryRule.new(min_price: 0, max_price: 50, cost: 4.95),
      DeliveryRule.new(min_price: 50, max_price: 90, cost: 2.95),
      DeliveryRule.new(min_price: 90, max_price: Float::INFINITY, cost: 0)
    ]
  end
end
