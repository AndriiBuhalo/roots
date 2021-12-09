# frozen_string_literal: true

class AlbumController < ApplicationController
  before_action :set_album, only: %i[show edit update destroy]

  def index
    @albums = Album.by_user(current_user)
  end

  def show
    @attachments = @album.attachments
  end

  def new
    @album = Album.new
    @album.attachments.build
  end

  def create
    @album = Album.by_user(current_user).new(album_params)
    if @album.save
      redirect_to @album, success: t('album.controller.create')
    else
      flash[:danger] = t('album.controller.create_error')
      render :new
    end
  end

  def edit
    @album.attachments.build
  end

  def update
    if @album.update(album_params)
      redirect_to @album, success: t('album.controller.update')
    else
      flash[:danger] = t('album.controller.update_error')
      render :edit
    end
  end

  def destroy
    @album.destroy
    redirect_to album_index_path, success: t('album.controller.destroy')
  end

  private

  def set_album
    @album = Album.by_user(current_user).find(params[:id])
  end

  def album_params
    params.require(:album).permit(:name, :description, attachments_attributes: %i[id _destroy file created_by_id])
  end
end
