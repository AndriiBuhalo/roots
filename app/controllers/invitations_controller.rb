class InvitationsController < ApplicationController
    def index
        @invitees = current_user.invitees
    end
end
