# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Album, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_least(3).is_at_most(50) }
    it { is_expected.to validate_length_of(:description).is_at_least(3).is_at_most(300) }
    it { is_expected.to belong_to(:created_by) }
  end
end
