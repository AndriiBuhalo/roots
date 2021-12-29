# frozen_string_literal: true

class AttachmentsController < DashboardController
  before_action :set_attachment, only: %i[show edit update destroy add_attachment_to_album]

  def index
    add_breadcrumb(t('.breadcrumb'))
    @attachments = policy_scope(Attachment)
    @attachments = @attachments.where('keywords LIKE ?', "%#{params[:tag]}%") if params[:tag].present?
    @attachments = authorize @attachments.paginate(page: params[:page])
  end

  def show
    add_breadcrumb(@attachment.original_filename)
    @albums = policy_scope(Album)
  end

  def new
    add_breadcrumb(t('.breadcrumb'))
    @attachment = policy_scope(Attachment).new
  end

  def create
    add_breadcrumb(t('.breadcrumb'))
    @attachment = authorize policy_scope(Attachment).new(file_params)
    if @attachment.save
      redirect_to @attachment, success: t('attachments.controller.create')
    else
      flash[:danger] = t('attachments.controller.create_error')
      render :new
    end
  end

  def edit
    add_breadcrumb(@attachment.original_filename, attachment_path(@attachment))
  end

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
    album = policy_scope(Album).find(params[:attachment_relation][:album])
    album.attachments << @attachment
    flash.now[:notice] = t('attachments.attachment_to_album')
  end

  private

  def set_attachment
    @attachment = authorize policy_scope(Attachment).find(params[:id])
  end

  def file_params
    params.require(:attachment).permit(:file, :keywords, :notes, :place, :date, :original_filename)
  end
end
