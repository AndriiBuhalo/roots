# frozen_string_literal: true

class AttachmentController < ApplicationController
  before_action :set_attachment, only: %i[show edit update destroy]

  def index
    @attachments = if params[:tag]
      Attachment.where(keywords: params[:tag]).order('id DESC')
    else
      Attachment.order('id DESC')
    end
  end

  def new
    @attachment = Attachment.new
  end

  def create
    if @attachment = Attachment.create(file_params)
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

  private
  
  def set_attachment
    @attachment = Attachment.find(params[:id])
  end

  def file_params
    params.require(:attachment).permit(:file, :keywords, :notes, :place, :date_accuracy, :file_date, :downloaded)
  end
end
