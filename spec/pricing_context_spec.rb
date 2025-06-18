# frozen_string_literal: true

require_relative '../lib/product'
require_relative '../lib/delivery_rule'
require_relative '../lib/offers/red_widget_offer'
require_relative '../lib/pricing_context'
require_relative '../lib/app_data'

RSpec.describe PricingContext do
  describe '#initialize' do
    let(:products) { AppData.products }
    let(:delivery_rules) { AppData.delivery_rules }
    let(:offers) { AppData.offers }

    it 'initializes with given products, delivery_rules, and offers' do
      context = PricingContext.new(
        products: products,
        delivery_rules: delivery_rules,
        offers: offers
      )

      expect(context.products).to eq(products)
      expect(context.delivery_rules).to eq(delivery_rules)
      expect(context.offers).to eq(offers)
    end
  end

  describe '.default' do
    it 'returns the default singleton context with App Data' do
      default_context = PricingContext.default

      expect(default_context).to be_a(PricingContext)

      default_context.products.each do |product|
        expected_product = Product.find_by_code(product.code)
        expect(product.code).to eq(expected_product.code)
        expect(product.price).to eq(expected_product.price)
      end

      expect(default_context.delivery_rules.map(&:cost)).to eq(AppData.delivery_rules.map(&:cost))

      expect(default_context.offers[0].title).to eq('buy one red widget, get the second half price')
      expect(default_context.offers[0].is_active).to eq(true)
    end
  end
end
