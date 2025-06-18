# frozen_string_literal: true

require_relative '../lib/product'

RSpec.describe Product do
  describe '#initialize' do
    it 'creates a product with upcased code and rounded price' do
      product = Product.new(name: 'Green Widget', code: 'g01', price: 24.949)
      expect(product.code).to eq('G01')
      expect(product.price).to eq(24.95)
      expect(product.name).to eq('Green Widget')
    end

    it 'raises error for empty code' do
      expect do
        Product.new(name: 'Some name', code: '', price: 10)
      end.to raise_error(ArgumentError, /Product code cannot be empty/)
    end

    it 'raises error for non-positive price' do
      expect do
        Product.new(name: 'New name', code: 'ABC', price: 0)
      end.to raise_error(ArgumentError, /Price must be positive/)
    end
  end
end
