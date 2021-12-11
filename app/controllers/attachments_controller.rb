# frozen_string_literal: true

class AttachmentsController < DashboardController
  before_action :set_attachment, only: %i[show edit update destroy]

  def index
    @attachments = Attachment.by_user(current_user)
    @attachments = @attachments.where('keywords LIKE ?', "%#{params[:tag]}%") if params[:tag]
  end

  def show
    @albums = Album.by_user(current_user)
  end

  def new
    @attachment = Attachment.new
  end

  def create
    @attachment = Attachment.by_user(current_user).new(file_params)
    if @attachment.save
      redirect_to @attachment, success: t('attachments.controller.create')
    else
      flash[:danger] = t('attachments.controller.create_error')
      render :new
    end
  end

  def edit; end

  def update
    if @attachment.update(file_params)
      redirect_to @attachment, success: t('attachments.controller.update')
    else
      flash[:danger] = t('attachments.controller.update_error')
      render :edit
    end
  end

  def destroy
    @attachment.destroy
    redirect_to attachments_path, success: t('attachments.controller.destroy')
  end

  def add_attachment_to_album
    album_id = params[:attachment_relation][:album]
    attachment_id = params[:attachment_relation][:attachment_id]
    AttachmentRelation.find_or_create_by(attachment_id: attachment_id, attachable_id: album_id,
                                         attachable_type: 'Album')
  end

  private

  def set_attachment
    @attachment = Attachment.by_user(current_user).find(params[:id])
  end

  def file_params
    params.require(:attachment).permit(:file, :keywords, :notes, :place, :date, :original_filename)
  end
end
