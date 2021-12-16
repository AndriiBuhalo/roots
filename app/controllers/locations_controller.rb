# frozen_string_literal: true

class LocationsController < DashboardController
  before_action :set_location, only: %i[show edit update destroy]

  def index
    @locations = collection.paginate(page: params[:page])
  end

  def show; end

  def new
    @location = collection.new
  end

  def edit; end

  def create
    @location = collection.new(location_params)
    if @location.save
      flash[:notice] = t('.controller.create')
      redirect_to @location
    else
      render 'new'
    end
  end

  def update
    if @location.update(location_params)
      flash[:notice] = t('.controller.update')
      redirect_to @location
    else
      render 'edit'
    end
  end

  def destroy
    @location.destroy
    flash[:notice] = t('.controller.destroy')
    redirect_to locations_url
  end

  private

  def collection
    Location.by_user(current_user)
  end

  def set_location
    @location = collection.find(params[:id])
  end

  def location_params
    params.require(:location).permit(:name, :address, :latitude, :longitude)
  end
end
