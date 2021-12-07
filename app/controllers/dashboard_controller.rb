# frozen_string_literal: true

class DashboardController < ApplicationController
  PER_PAGE = 20
  before_action :authenticate_user!
end
