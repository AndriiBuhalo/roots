require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'validation tests' do
    # let(:post) { build(:post) } #Post.new

    it 'ensures title presence' do
      post = Post.new(content: "12345678910123456789101234567891012345678910123456789101234567891012345678910").save
      # post.title = nil
      expect(post).to eq(false)
    end
  end




end
