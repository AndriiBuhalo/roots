# frozen_string_literal: true

class LocalesController < ApplicationController
  def update
    cookies[:locale] = params[:locale]
    I18n.locale = params[:locale]
    redirect_back fallback_location: welcome_path, notice: I18n.t('global.translation_notification')
  end
end
