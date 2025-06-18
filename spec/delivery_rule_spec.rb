# frozen_string_literal: true

require_relative '../lib/delivery_rule'

RSpec.describe DeliveryRule do
  describe '#initialize' do
    it 'initializes correctly with valid inputs' do
      rule = DeliveryRule.new(min_price: 0, max_price: 50, cost: 4.95)
      expect(rule.min_price).to eq(0.0)
      expect(rule.max_price).to eq(50.0)
      expect(rule.cost).to eq(4.95)
    end

    it 'raises an error if min_price is greater than or equal to max_price' do
      expect do
        DeliveryRule.new(min_price: 50, max_price: 50, cost: 4.95)
      end.to raise_error(ArgumentError, /Invalid price range/)

      expect do
        DeliveryRule.new(min_price: 60, max_price: 50, cost: 4.95)
      end.to raise_error(ArgumentError, /Invalid price range/)
    end

    it 'raises an error if cost is negative' do
      expect do
        DeliveryRule.new(min_price: 0, max_price: 50, cost: -1)
      end.to raise_error(ArgumentError, /Delivery cost cannot be negative/)
    end
  end
end
