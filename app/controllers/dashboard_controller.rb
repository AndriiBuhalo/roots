# frozen_string_literal: true

class DashboardController < ApplicationController
  include Pundit
  before_action :authenticate_user!

  rescue_from Pundit::NotAuthorizedError do
    redirect_to posts_path, notice: 'You do not have access to this page'
  end
end
