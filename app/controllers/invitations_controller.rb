# frozen_string_literal: true

class InvitationsController < DashboardController
  def index
    add_breadcrumb(t('invitations.index.breadcrumb'))
    @invitees = current_user.invitees.paginate(page: params[:page])
  end
end
