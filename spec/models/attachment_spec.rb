# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Attachment, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:file) }
    # it { is_expected.to validate_length_of(:keyword).is_at_least(3).is_at_most(50) }
    # it { is_expected.to validate_length_of(:notes).is_at_least(3).is_at_most(300) }
    # it { is_expected.to validate_length_of(:place).is_at_least(3).is_at_most(150) }
  end
end
