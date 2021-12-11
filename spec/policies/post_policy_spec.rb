# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PostPolicy, type: :policy do
  subject { PostPolicy }

  let(:user) { create(:user) }

  def resolve_for(user)
    subject::Scope.new(user, Post).resolve
  end

  permissions '.scope' do
    it 'allows the user to see his posts' do
      expect(resolve_for(user).count).to eq(1)
    end
  end

  permissions :show?, :update?, :destroy? do
    describe 'current user of post' do
      let(:post) { create(:post, created_by: user) }

      it 'grants access if user is current user of post' do
        expect(subject).to permit(user, post)
      end
    end

    describe 'Admin' do
      let(:admin) { create(:user, role: 1) }
      let(:post) { create(:post, created_by: admin) }

      it 'grants access if user is an admin' do
        expect(subject).to permit(admin, post)
      end
    end

    describe 'not current_user of post' do
      let(:not_current_user) { create(:user) }
      let(:post) { create(:post, created_by: user) }

      it 'denies access if user is not current user of post' do
        expect(subject).not_to permit(not_current_user, post)
      end
    end
  end
end
