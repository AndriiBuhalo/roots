require 'rails_helper'

RSpec.describe Location, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_least(3).is_at_most(255) }
    it { is_expected.to validate_presence_of(:address) }
    it { is_expected.to validate_length_of(:address).is_at_least(5).is_at_most(255) }
    it { is_expected.to validate_numericality_of(:latitude) }
    it { is_expected.to allow_value(51.361125).for(:latitude) }
    it { is_expected.not_to allow_value(92.3).for(:latitude) }
    it { is_expected.to validate_numericality_of(:longitude) }
    it { is_expected.to allow_value(171.361125).for(:longitude) }
    it { is_expected.not_to allow_value(192.34).for(:longitude) }
    it { is_expected.to belong_to(:created_by) }
  end
end
