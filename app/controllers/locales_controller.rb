class LocalesController < ApplicationController
  def update
    session[:locale] = params[:id]
    redirect_to request.referrer, notice: t('global.translate')
  end
end
