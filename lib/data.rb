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
end
