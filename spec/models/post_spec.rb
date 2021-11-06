require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'validation tests' do
    let(:post) { build(:post) } #Post.new

    it 'ensures title presence' do
      post.title = nil
      expect(post.save).to eq(false)
    end
  end




end
