# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Attachment, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:file) }
    it { is_expected.to belong_to(:created_by) }
  end
end
