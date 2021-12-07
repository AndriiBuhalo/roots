# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:content) }
    it { is_expected.to validate_length_of(:title).is_at_least(3).is_at_most(255) }
    it { is_expected.to validate_length_of(:content).is_at_least(5).is_at_most(1000) }
    it { is_expected.to belong_to(:created_by) }
  end
end
