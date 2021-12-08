# frozen_string_literal: true

class DashboardController < ApplicationController
  include Pundit
  before_action :authenticate_user!
end
