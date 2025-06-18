# frozen_string_literal: true

require_relative '../lib/offers/base_offer'

RSpec.describe BaseOffer do
  describe '#initialize' do
    it 'initializes with valid title and is_active status' do
      offer = BaseOffer.new(title: '10% OFF', is_active: true)

      expect(offer).to be_a(BaseOffer)
      expect(offer.send(:title)).to eq('10% OFF')
      expect(offer.is_active).to eq(true)
    end

    it 'raises an error when title is empty' do
      expect do
        BaseOffer.new(title: '', is_active: true)
      end.to raise_error(ArgumentError, 'Title cannot be empty')
    end
  end

  describe '#apply' do
    it 'returns 0.0 by default' do
      offer = BaseOffer.new(title: 'No Discount', is_active: false)
      expect(offer.apply).to eq(0.0)
    end
  end
end
