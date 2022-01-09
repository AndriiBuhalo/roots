# frozen_string_literal: true

class Location < ApplicationRecord
  include CreatableBy

  validates :name, presence: true, length: { minimum: 3, maximum: 255 }
  validates :address, presence: true, length: { minimum: 5, maximum: 255 }
  validates :latitude, numericality: { greater_than_or_equal_to: -90, less_than_or_equal_to: 90 }
  validates :longitude, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }
end
