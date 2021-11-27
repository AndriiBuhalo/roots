class LocalesController < ApplicationController
  def update
    cookies.permanent[:locale] = params[:id]
    redirect_to request.referer, notice: t('global.translate')
  end
end
