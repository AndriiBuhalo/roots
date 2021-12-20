# frozen_string_literal: true

class DashboardController < ApplicationController
  include Breadcrumbs
  before_action :authenticate_user!
end
