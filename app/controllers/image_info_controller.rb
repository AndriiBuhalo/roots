class ImageInfoController < ApplicationController

  def edit
    @imageInfo = ImageInfo.find_by_filename(params[:filename])
  end

  def update
    @imageInfo = ImageInfo.find(params[:id])
    if @imageInfo.update(image_params)
      @image = Image.find(@imageInfo.image_id)
      redirect_to @image, success: t('image_info.controller.update')
    else
      redirect_to edit_image_info_path, danger: t('image_info.controller.update error')
    end
  end

  def image_params
    params.require(:image_info).permit(:keywords, :notes, :place, :date_accuracy, :image_date)
  end
end
