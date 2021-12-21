# frozen_string_literal: true

class AlbumsController < DashboardController
  before_action :set_album, only: %i[show edit update destroy]

  def index
    @albums = policy_scope(Album).paginate(page: params[:page])
    authorize @albums
  end

  def show
    @attachments = @album.attachments.paginate(page: params[:page])
  end

  def new
    @album = policy_scope(Album).new
    authorize @album
    @album.attachments.build
  end

  def create
    @album = policy_scope(Album).new(album_params)
    authorize @album
    if @album.save
      redirect_to @album, success: t('albums.controller.create')
    else
      flash[:danger] = t('albums.controller.create_error')
      render :new
    end
  end

  def edit
    @album.attachments.build
  end

  def update
    if @album.update(album_params)
      redirect_to @album, success: t('albums.controller.update')
    else
      flash[:danger] = t('albums.controller.update_error')
      render :edit
    end
  end

  def destroy
    @album.destroy
    redirect_to albums_path, success: t('albums.controller.destroy')
  end

  private

  def set_album
    @album = Album.find(params[:id])
    authorize @album
  end

  def album_params
    params.require(:album).permit(:name, :description, attachments_attributes: %i[id _destroy file created_by_id])
  end
end
