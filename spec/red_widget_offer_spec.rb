# frozen_string_literal: true

require_relative '../lib/offers/red_widget_offer'

RSpec.describe RedWidgetOffer do
  describe '.apply' do
    let(:red_widget) { Product.find_by_code('R01') }

    it 'returns 0 when there are no R01 products' do
      products = [
        Product.find_by_code('G01'),
        Product.find_by_code('B01')
      ]
      expect(RedWidgetOffer.apply(products)).to eq(0)
    end

    it 'returns 0 when there is only one R01 product' do
      products = [red_widget]
      expect(RedWidgetOffer.apply(products)).to eq(0)
    end

    it 'returns half price of one R01 when there are 2 R01s' do
      products = [red_widget, red_widget]
      expected_discount = red_widget.price / 2.0
      expect(RedWidgetOffer.apply(products)).to eq(expected_discount)
    end

    it 'returns correct discount for 3 R01s (only one pair counts)' do
      products = [red_widget, red_widget, red_widget]
      expected_discount = red_widget.price / 2.0
      expect(RedWidgetOffer.apply(products)).to eq(expected_discount)
    end

    it 'returns correct discount for 4 R01s (two pairs)' do
      products = [red_widget] * 4
      expected_discount = 2 * (red_widget.price / 2.0)
      expect(RedWidgetOffer.apply(products)).to eq(expected_discount)
    end
  end
end
