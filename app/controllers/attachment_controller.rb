class AttachmentController < ApplicationController
  before_action :set_post, only: [ :show, :edit, :update, :destroy ]

  def index
    @attachments = Attachment.all.reverse
    @albums = Album.all
  end

  def findByTag
    @albums = Album.all
    @attachments = Attachment.all.reverse
    @findIdByTag = []
    @findFilenameByTag = []
    ImageInfo.where(:keywords => params[:tag]).all.each do |findIdByTag|
      @findIdByTag << findIdByTag.image_id
      @findFilenameByTag << findIdByTag.filename
    end
  end

  def show
    @albums = Album.all
    @imageInfo = ImageInfo.find_by_filename(@attachment.identifier)
  end

  def new
    @attachment = Attachment.new
  end

  def create
    if @attachment = Attachment.create(file_params)
      if params[:attachment][:id].present?
        @album = Album.find(params[:attachment][:id])
        @album.attachments << @attachment
      end
      unless ImageInfo.exists?(attachment_id: @attachment.id)
         ImageInfo.create(attachment_id: @attachment.id)
      end
      redirect_to attachment_index_path, success: t('image.controller.create')
    else
      redirect_to new_attachment_path, danger: t('image.controller.create error')
    end
  end

  def update
    if @attachment.update(file_params)
      redirect_to attachment_index_path, success: t('image.controller.update')
    else
      flash.now[:danger] = t('image.controller.update error')
      render :edit
    end
  end

  def destroy
    @attachment.destroy
    redirect_to attachment_index_path, success: t('image.controller.destroy')
  end

  private def set_post
    @attachment = Attachment.find(params[:id])
  end

  def file_params
    params.require(:attachment).permit(:file)
  end
end
