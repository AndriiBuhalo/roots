# frozen_string_literal: true

class Location < ApplicationRecord
    include CreatableBy

    validates :name, presence: true, length: { minimum: 3, maximum: 255 }
    validates :address, presence: true, length: { minimum: 5, maximum: 255 }
    validates :latitude, numericality: true, format: { with: /\A\-?([0-8]?[0-9](\.\d{1,6})?|90(.[0]+)?)\z/ }
    validates :longitude, numericality: true, format: { with: /\A\-?([1]?[0-7]?[0-9](\.\d{1,6})?|180((.[0]{1,6})?))\z/ }
end
