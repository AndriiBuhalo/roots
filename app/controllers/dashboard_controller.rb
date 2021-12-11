# frozen_string_literal: true

class DashboardController < ApplicationController
  include Pundit
  before_action :authenticate_user!

  rescue_from Pundit::NotAuthorizedError do
    redirect_to posts_path, notice: t('global.access')
  end
end
