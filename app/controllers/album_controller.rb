class AlbumController < ApplicationController
  before_action :set_post, only: [ :show, :edit, :update, :destroy ]

  def index
    @albums = Album.all
  end

  def show
    @albums = Album.all
    @images = @album.attachments.all.reverse
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
    redirect_to attachment_index_path, success: t('album.controller.destroy')
  end

  private def set_post
    @album = Album.find(params[:id])
  end

  def album_params
    params.require(:album).permit(:name, :description)
  end
end
