# frozen_string_literal: true

require_relative '../lib/basket'
require_relative '../lib/product'
require_relative '../lib/delivery_rule'
require_relative '../lib/offers/red_widget_offer'
require_relative '../lib/app_data'
require_relative '../lib/pricing_context'

RSpec.describe Basket do
  let(:context) { PricingContext.default }
  let(:basket) { Basket.new(context: context) }

  describe '#initialize' do
    it 'initializes with an empty items list' do
      expect(basket.items).to eq([])
    end
  end

  describe '#add' do
    it 'adds valid products by code' do
      basket.add('R01')
      expect(basket.items.first.code).to eq('R01')
    end

    it 'ignores invalid product codes and does not raise an error' do
      expect { basket.add('INVALID') }.not_to raise_error
      expect(basket.items).to be_empty
    end
  end

  describe '#total' do
    let(:r01) { context.products[0] }
    let(:g01) { context.products[1] }
    let(:b01) { context.products[2] }

    it 'calculates total without any discounts or delivery' do
      basket.add('B01') # 7.95
      basket.add('B01') # 7.95
      expect(basket.total).to eq(7.95 * 2 + 4.95) # delivery rule applies (< 50)
    end

    it 'applies RedWidgetOffer for 2 R01s' do
      basket.add('R01')
      basket.add('R01')
      expected_discount = r01.price / 2.0
      subtotal = r01.price * 2
      delivery = context.delivery_rules.find do |r|
        r.applies_to?(subtotal - expected_discount)
      end.cost
      total = (subtotal - expected_discount + delivery).round(2)
      expect(basket.total).to eq(total)
    end

    it 'calculates correct total for mixed products with discount and delivery' do
      basket.add('R01') # 32.95
      basket.add('R01') # 32.95
      basket.add('R01') # 32.95 (only 2 counted for discount)
      basket.add('G01') # 24.95
      subtotal = 32.95 * 3 + 24.95
      discount = (32.95 / 2.0) # only one pair discounted
      after_discount = subtotal - discount
      delivery = context.delivery_rules.find { |r| r.applies_to?(after_discount) }.cost
      total = (after_discount + delivery).round(2)
      expect(basket.total).to eq(total)
    end

    # example baskets and expected totals from the assessment document
    it 'checks the given implementation' do
      basket.add('B01')
      basket.add('B01')
      basket.add('R01')
      basket.add('R01')
      basket.add('R01')
      expect(basket.total).to eq(98.28)
    end
  end
end
