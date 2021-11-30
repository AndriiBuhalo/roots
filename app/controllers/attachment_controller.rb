# frozen_string_literal: true

class AttachmentController < ApplicationController
  before_action :set_attachment, only: %i[show edit update destroy]

  def index
    @attachments = Attachment.order(id: :desc)
    @attachments = @attachments.where(keyword: params[:tag]) if params[:tag]
  end

  def new
    @attachment = Attachment.new
  end

  def create
    @attachment = Attachment.new(file_params)
    if @attachment.save
      redirect_to @attachment, success: t('attachment.controller.create')
    else
      flash[:danger] = t('attachment.controller.create_error')
      render :new
    end
  end

  def update
    if @attachment.update(file_params)
      redirect_to @attachment, success: t('attachment.controller.update')
    else
      flash[:danger] = t('attachment.controller.update_error')
      render :edit
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
    params.require(:attachment).permit(:file_name, :file, :keyword, :notes, :place, :date)
  end
end
