# frozen_string_literal: true

class InvitationsController < ApplicationController
  def index
    @invitees = current_user.invitees
  end

  def new; end
end
