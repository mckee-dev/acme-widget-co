# frozen_string_literal: true

# This class saves as a base class for all the offers
class BaseOffer
  attr_reader :title, :is_active

  def initialize(title:, is_active:)
    @title = title
    @is_active = is_active
    validate!
  end

  def apply
    0.0
  end

  private

  def validate!
    raise ArgumentError, 'Title cannot be empty' if title.empty?
  end
end
