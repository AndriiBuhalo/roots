class AttachmentController < ApplicationController
  before_action :set_post, only: [ :show, :edit, :update, :destroy ]

  def index
    @attachments = Attachment.all.reverse
  end

  def findByTag
    @attachments = Attachment.where(:keywords => params[:tag]).all.reverse 
  end

  def show
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
      redirect_to attachment_index_path, success: t('attachment.controller.create')
    else
      redirect_to new_attachment_path, danger: t('attachment.controller.create error')
    end
  end

  def update
    if @attachment.update(file_params)
      redirect_to @attachment, success: t('attachment.controller.update')
    else
      redirect_to edit_attachment_path, danger: t('attachment.controller.update error')
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
    params.require(:attachment).permit(:file, :keywords, :notes, :place, :date_accuracy, :file_date, :downloaded)
  end
end
