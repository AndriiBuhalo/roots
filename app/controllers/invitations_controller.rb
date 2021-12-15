# frozen_string_literal: true

class InvitationsController < DashboardController
  def index
    @invitees = current_user.invitees
  end
end
