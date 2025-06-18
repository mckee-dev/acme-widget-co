# frozen_string_literal: true

# This class handles delivery rule initialization, validation, and its associated methods
class DeliveryRule
  attr_reader :min_price, :max_price, :cost

  def initialize(min_price:, max_price:, cost:)
    @min_price = min_price.to_f
    @max_price = max_price.to_f
    @cost = cost.to_f.round(2)
    validate!
  end

  def applies_to?(subtotal)
    subtotal >= min_price && subtotal < max_price
  end

  private

  def validate!
    raise ArgumentError, 'Invalid price range' if min_price >= max_price
    raise ArgumentError, 'Delivery cost cannot be negative' if cost.negative?
  end
end
