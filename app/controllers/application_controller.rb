# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_breadcrumbs
  before_action :set_locale
  add_flash_types :success, :danger, :info, :warning

  def add_breadcrumb(label, path = nil)
    @breadcrumbs.push({ label: label, path: path })
  end

  private

  def set_breadcrumbs
    @breadcrumbs = []
  end

  def set_locale
    locale_in_cookies = I18n.available_locales.map(&:to_s).include?(cookies[:locale])
    I18n.locale = locale_in_cookies ? cookies[:locale] : I18n.default_locale
  end
end
