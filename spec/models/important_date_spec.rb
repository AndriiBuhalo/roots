# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ImportantDate, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:event_name) }
    it { is_expected.to validate_presence_of(:event_date) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_length_of(:event_name).is_at_least(3).is_at_most(255) }
    it { is_expected.to validate_length_of(:description).is_at_least(3).is_at_most(500) }
    it { is_expected.to belong_to(:created_by) }
  end
end
