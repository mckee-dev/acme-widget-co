# frozen_string_literal: true

# This class is initialised with the pricing context which includes
# product catalogue, delivery charge rules, and offers
class Basket
  attr_reader :context, :items

  def initialize(context: PricingContext.default)
    @context = context
    @items = []
  end

  # This method takes the product code as a parameter and adds item in the basket
  def add(product_code)
    product = Product.find_by_code(product_code)
    @items << product if product
  rescue StandardError => e
    puts "Error: #{e.message}"
  end

  # This method returns the total cost of the basket,
  # taking into account  the delivery and offer rules
  def total
    subtotal = @items.sum(&:price)
    discount = @context.offers.sum { |offer| offer.class.apply(@items) }
    delivery_cost = calculate_delivery(subtotal - discount)
    (subtotal - discount + delivery_cost).round(2)
  end

  private

  def calculate_delivery(subtotal)
    rule = @context.delivery_rules.find { |r| r.applies_to?(subtotal) }
    rule&.cost || 0
  end
end
