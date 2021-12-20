# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_locale
  add_flash_types :success, :danger, :info, :warning

  private

  def set_locale
    locale_in_cookies = I18n.available_locales.map(&:to_s).include?(cookies[:locale])
    I18n.locale = locale_in_cookies ? cookies[:locale] : I18n.default_locale
  end
end
