# frozen_string_literal: true

require_relative 'app_data'

# This class acts as a single interface for all the app data to be included in the basket
class PricingContext
  attr_reader :products, :delivery_rules, :offers

  def initialize(products:, delivery_rules:, offers:)
    @products = products
    @delivery_rules = delivery_rules
    @offers = offers
  end

  # Serves as a singleton object for this class
  @default = new(
    products: AppData.products,
    delivery_rules: AppData.delivery_rules,
    offers: AppData.offers
  )

  class << self
    attr_reader :default
  end
end
