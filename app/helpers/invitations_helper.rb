# frozen_string_literal: true

module InvitationsHelper
  def invitation_status(invitee)
    invitee.invitation_accepted_at ? t('invitations.index.status.accepted') : t('invitations.index.status.non-accepted')
  end
end
