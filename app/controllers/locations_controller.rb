# frozen_string_literal: true

class LocationsController < DashboardController
  before_action :set_location, only: %i[show edit update destroy]

  def index
    @locations = policy_scope(Location).paginate(page: params[:page])
    authorize @locations
  end

  def show; end

  def new
    @location = policy_scope(Location).new
    authorize @location
  end

  def edit; end

  def create
    @location = policy_scope(Location).new(location_params)
    authorize @location
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

  def set_location
    @location = policy_scope(Location).find(params[:id])
    authorize @location
  end

  def location_params
    params.require(:location).permit(:name, :address, :latitude, :longitude)
  end
end
