# frozen_string_literal: true

class AlbumController < ApplicationController
  before_action :set_album, only: %i[show edit update destroy]

  def index
    @albums = Album.order('id DESC')
  end

  def show
    @attachments = @album.attachments
  end

  def new
    @album = Album.new
  end

  def create
    if @album = Album.create(album_params)
      redirect_to @album, success: t('album.controller.create')
    else
      redirect_to new_albom_path, danger: t('album.controller.create error')
    end
  end

  def edit
    @album.attachments.build(notes: 'Fancy-Fancy')
  end

  def update
    if @album.update(album_params)
      redirect_to @album, success: t('album.controller.update')
    else
      flash.now[:danger] = t('album.controller.update error')
      render :edit
    end
  end

  def destroy
    @album.destroy
    redirect_to album_index_path, success: t('album.controller.destroy')
  end

  private

  def set_album
    @album = Album.find(params[:id])
  end

  def album_params
    params.require(:album).permit(:name, :description, attachments_attributes: [:id, :downloaded, :file, :_destroy])
  end
end
