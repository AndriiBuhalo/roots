# frozen_string_literal: true

class InvitationsController < DashboardController
  def index
    @invitees = current_user.invitees
  end

  def new
    redirect_to new_user_invitation_path
  end
end
