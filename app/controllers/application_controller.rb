# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_locale
  add_flash_types :success, :danger, :info, :warning

  private

  def default_url_options
    { locale: I18n.locale }
  end

  def set_locale
    if params[:locale].present?
      cookies.permanent[:locale] = params[:locale] # save cookies
    end
    locale = cookies[:locale]&.to_sym # read cookies
    if I18n.available_locales.include?(locale)
      I18n.locale = locale # use cookies locale
    end
  end
end
