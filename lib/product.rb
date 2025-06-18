# frozen_string_literal: true

# This class handles product initialization and validation
class Product
  attr_reader :name, :code, :price

  def initialize(name:, code:, price:)
    @name = name
    @code = code.to_s.upcase
    @price = price.to_f.round(2)
    validate!
  end

  private

  def validate!
    raise ArgumentError, 'Product code cannot be empty' if code.empty?
    raise ArgumentError, 'Price must be positive' unless price.positive?
  end
end
