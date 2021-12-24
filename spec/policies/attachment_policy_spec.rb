# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AttachmentPolicy, type: :policy do
  subject(:attachment_policy) { described_class }

  let(:user) { create(:user) }
  let(:attachment) { create(:attachment, created_by: user) }
  let(:policy_scope) { AttachmentPolicy::Scope.new(user, Attachment).resolve }

  permissions '.scope' do
    it 'allows the user to see his attachments' do
      expect(policy_scope).to eq [attachment]
    end
  end

  permissions :show?, :create?, :new?, :update?, :edit?, :destroy?, :add_attachment_to_album? do
    describe 'current user of attachment' do
      it 'grants access if user is current user of post' do
        expect(attachment_policy).to permit(user, attachment)
      end
    end

    describe 'Admin' do
      let(:admin) { create(:user, :admin) }
      let(:attachment) { create(:attachment, created_by: admin) }

      it 'grants access if user is an admin' do
        expect(attachment_policy).to permit(admin, attachment)
      end
    end

    describe 'not current_user of attachment' do
      let(:not_current_user) { create(:user) }

      it 'denies access if user is not current user of attachment' do
        expect(attachment_policy).not_to permit(not_current_user, attachment)
      end
    end
  end
end
