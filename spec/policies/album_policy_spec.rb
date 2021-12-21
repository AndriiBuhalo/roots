# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AlbumPolicy, type: :policy do
  subject(:album_policy) { described_class }

  let(:user) { create(:user) }
  let(:album) { create(:album, created_by: user) }
  let(:policy_scope) { AlbumPolicy::Scope.new(user, Album).resolve }

  permissions '.scope' do
    it 'allows the user to see his albums' do
      expect(policy_scope).to eq [album]
    end
  end

  permissions :show?, :create?, :new?, :update?, :edit?, :destroy?, :add_attachment_to_album? do
    describe 'current user of album' do
      it 'grants access if user is current user of post' do
        expect(album_policy).to permit(user, album)
      end
    end

    describe 'Admin' do
      let(:admin) { create(:user, :admin) }
      let(:album) { create(:album, created_by: admin) }

      it 'grants access if user is an admin' do
        expect(album_policy).to permit(admin, album)
      end
    end

    describe 'not current_user of album' do
      let(:not_current_user) { create(:user) }

      it 'denies access if user is not current user of album' do
        expect(album_policy).not_to permit(not_current_user, album)
      end
    end
  end
end
