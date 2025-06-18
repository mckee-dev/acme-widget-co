# frozen_string_literal: true

require_relative 'base_offer'

# This class handles the application logic of the Red Widget Discount Offer
class RedWidgetOffer < BaseOffer
  def self.apply(products)
    red_widgets = products.count { |p| p.code == 'R01' }
    (red_widgets / 2) * (Product.find_by_code('R01').price / 2.0)
  end
end
