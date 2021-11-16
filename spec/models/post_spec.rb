require 'rails_helper'

RSpec.describe Post, type: :model do

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:content) }
    it { should validate_length_of(:title).is_at_least(3).is_at_most(50) }
    it { should validate_length_of(:content).is_at_least(60).is_at_most(10000) }
  end

end
