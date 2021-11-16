class AttachmentController < ApplicationController
  before_action :set_post, only: [ :show, :edit, :update, :destroy ]

  def index
    @attachments = Attachment.all.reverse
  end

  def findByTag
    @attachments = Attachment.all.reverse
    @findIdByTag = []
    ImageInfo.where(:keywords => params[:tag]).all.each do |findIdByTag|
      @findIdByTag << findIdByTag.attachment_id
    end
  end

  def show
    @imageInfo = ImageInfo.find_by_attachment_id(@attachment)
  end

  def new
    @attachment = Attachment.new
  end

  def create
    if @attachment = Attachment.create(file_params)
      if params[:attachment][:albumId].present?
        @album = Album.find(params[:attachment][:albumId])
        @album.attachments << @attachment
      end
      ImageInfo.create(attachment_id: @attachment.id)
      redirect_to attachment_index_path, success: t('attachment.controller.create')
    else
      redirect_to new_attachment_path, danger: t('attachment.controller.create error')
    end
  end

  def update
    if @attachment.update(file_params)
      redirect_to attachment_index_path, success: t('attachment.controller.update')
    else
      flash.now[:danger] = t('attachment.controller.update error')
      render :edit
    end
  end

  def destroy
    @attachment.destroy
    redirect_to attachment_index_path, success: t('attachment.controller.destroy')
  end

  private def set_post
    @attachment = Attachment.find(params[:id])
  end

  def file_params
    params.require(:attachment).permit(:file, :title)
  end
end
