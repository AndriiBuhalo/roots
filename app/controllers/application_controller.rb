# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_locale
  add_flash_types :success, :danger, :info, :warning

  private

  def set_locale
    I18n.locale = cookies[:locale] || I18n.default_locale
  end

end
