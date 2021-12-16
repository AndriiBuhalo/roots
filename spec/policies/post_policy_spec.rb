# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PostPolicy, type: :policy do
  subject(:post_policy) { described_class }

  let(:user) { create(:user) }
  let(:post) { create(:post, created_by: user) }
  let(:policy_scope) { PostPolicy::Scope.new(user, Post).resolve }

  permissions '.scope' do
    it 'allows the user to see his posts' do
      expect(policy_scope).to eq [post]
    end
  end

  permissions :show?, :create?, :new?, :update?, :edit?, :destroy? do
    describe 'current user of post' do
      it 'grants access if user is current user of post' do
        expect(post_policy).to permit(user, post)
      end
    end

    describe 'Admin' do
      let(:admin) { create(:user, :admin) }
      let(:post) { create(:post, created_by: admin) }

      it 'grants access if user is an admin' do
        expect(post_policy).to permit(admin, post)
      end
    end

    describe 'not current_user of post' do
      let(:not_current_user) { create(:user) }

      it 'denies access if user is not current user of post' do
        expect(post_policy).not_to permit(not_current_user, post)
      end
    end
  end
end
