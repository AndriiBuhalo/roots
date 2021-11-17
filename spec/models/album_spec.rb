require 'rails_helper'

RSpec.describe Album, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(3).is_at_most(50) }
    it { should validate_length_of(:description).is_at_least(3).is_at_most(300) }
  end
end
