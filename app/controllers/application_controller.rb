# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_breadcrumbs

  add_flash_types :success, :danger, :info, :warning

  def add_breadcrumb(label, path = nil)
    @breadcrumbs << { label: label, path: path }
  end

  def set_breadcrumbs
    @breadcrumbs = []
  end

end
