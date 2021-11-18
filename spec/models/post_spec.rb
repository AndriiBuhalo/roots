# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:content) }
    it { is_expected.to validate_length_of(:title).is_at_least(3).is_at_most(50) }
    it { is_expected.to validate_length_of(:content).is_at_least(60).is_at_most(10_000) }
  end
end
