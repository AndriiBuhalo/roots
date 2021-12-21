# frozen_string_literal: true

class DashboardController < ApplicationController
  include Breadcrumbs
  include Pundit
  before_action :authenticate_user!

  rescue_from Pundit::NotAuthorizedError do
    redirect_to authenticated_root, notice: t('global.access')
  end
end
