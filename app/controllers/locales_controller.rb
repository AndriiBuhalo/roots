# frozen_string_literal: true

class LocalesController < ApplicationController
  after_action :show_flash

  def update
    cookies[:locale] = params[:id]
    redirect_back fallback_location: welcome_pages_home_path # request.referer
  end

  private

  def show_flash
    I18n.locale = cookies[:locale] || I18n.default_locale
    flash[:notice] = I18n.t 'global.translate'
  end
end
