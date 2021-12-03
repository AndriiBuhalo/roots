# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_locale
  add_flash_types :success, :danger, :info, :warning

  private

  def set_locale
    if I18n.available_locales.include?(cookies[:locale].to_sym)
      I18n.locale = cookies[:locale]
    else
      I18n.locale = I18n.default_locale
    end
  end
end
