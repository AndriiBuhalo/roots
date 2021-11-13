class ImageController < ApplicationController
  before_action :set_post, only: [ :show, :edit, :update, :destroy ]

  def index
    @image = Image.all.reverse
    @albums = Album.all
  end

  def findByTag
    @albums = Album.all
    @image = Image.all.reverse
    @findIdByTag = []
    @findFilenameByTag = []
    ImageInfo.where(:keywords => params[:tag]).all.each do |findIdByTag|
      @findIdByTag << findIdByTag.image_id
      @findFilenameByTag << findIdByTag.filename
    end

  end

  def show
    @image.attachments.each_with_index do |attachment, index|
      if params[:index].to_i == index
        @attachment = attachment
      end
    end
    unless ImageInfo.exists?(filename: @attachment.identifier)
       ImageInfo.create(filename: @attachment.identifier, image_id: @image.id)
    end
    @albums = Album.all
    @imageInfo = ImageInfo.find_by_filename(@attachment.identifier)
  end

  def new
    @image = Image.new
  end

  def create
    if @image = Image.create(image_params)
      if params[:image][:id].present?
        @album = Album.find(params[:image][:id])
        @album.images << @image
      end
      redirect_to image_index_path, success: t('image.controller.create')
    else
      redirect_to new_image_path, danger: t('image.controller.create error')
    end
  end

  def update
    if @image.update(image_params)
      redirect_to image_index_path, success: t('image.controller.update')
    else
      flash.now[:danger] = t('image.controller.update error')
      render :edit
    end
  end

  def destroy
    @image.destroy
    redirect_to image_index_path, success: t('image.controller.destroy')
  end

  private def set_post
    @image = Image.find(params[:id])
  end

  def image_params
    params.require(:image).permit(attachments: [])
  end
end
