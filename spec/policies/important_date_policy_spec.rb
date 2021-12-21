# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ImportantDatePolicy, type: :policy do
  subject(:important_date_policy) { described_class }

  let(:user) { create(:user) }
  let(:important_date) { create(:important_date, created_by: user) }
  let(:policy_scope) { ImportantDatePolicy::Scope.new(user, ImportantDate).resolve }

  permissions '.scope' do
    it 'allows the user to see his important dates' do
      expect(policy_scope).to eq [important_date]
    end
  end

  permissions :show?, :create?, :new?, :update?, :edit?, :destroy? do
    describe 'current user of important date' do
      it 'grants access if user is current user of important date' do
        expect(important_date_policy).to permit(user, important_date)
      end
    end

    describe 'Admin' do
      let(:admin) { create(:user, :admin) }
      let(:important_date) { create(:important_date, created_by: admin) }

      it 'grants access if user is an admin' do
        expect(important_date_policy).to permit(admin, important_date)
      end
    end

    describe 'not current_user of important date' do
      let(:not_current_user) { create(:user) }

      it 'denies access if user is not current user of important date' do
        expect(important_date_policy).not_to permit(not_current_user, important_date)
      end
    end
  end
end
