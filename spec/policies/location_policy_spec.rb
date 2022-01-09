# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LocationPolicy, type: :policy do
  subject(:location_policy) { described_class }

  let(:user) { create(:user) }
  let(:location) { create(:location, created_by: user) }
  let(:policy_scope) { LocationPolicy::Scope.new(user, Location).resolve }

  permissions '.scope' do
    it 'allows the User to see his locations' do
      expect(policy_scope).to eq [location]
    end
  end

  permissions :show?, :create?, :new?, :update?, :edit?, :destroy? do
    describe 'Current User of Location' do
      it 'grants access if User is Current User of Location' do
        expect(location_policy).to permit(user, location)
      end
    end

    describe 'Admin' do
      let(:admin) { create(:user, :admin) }
      let(:location) { create(:location, created_by: admin) }

      it 'grants access if User is an Admin' do
        expect(location_policy).to permit(admin, location)
      end
    end

    describe 'not a Current User of Location' do
      let(:not_current_user) { create(:user) }

      it 'denies access if User is not a Current User of Location' do
        expect(location_policy).not_to permit(not_current_user, location)
      end
    end
  end
end
