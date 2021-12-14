# frozen_string_literal: true

class Location < ApplicationRecord
    include CreatableBy

    validates :name, presence: true, length: { minimum: 3, maximum: 255 }
    validates :address, presence: true, length: { minimum: 5, maximum: 255 }
end
