# frozen_string_literal: true

class LocationsController < DashboardController
  before_action :set_location, only: %i[show edit update destroy]

  def index
    add_breadcrumb(t('locations.index.breadcrumb'))
    @locations = authorize policy_scope(Location).paginate(page: params[:page])
  end

  def show
    add_breadcrumb(@location.name)
  end

  def new
    add_breadcrumb(t('locations.new.breadcrumb'))
    @location = policy_scope(Location).new
  end

  def edit
    add_breadcrumb(@location.name, location_path(@location))
    add_breadcrumb(t('locations.edit.breadcrumb'))
  end

  def create
    add_breadcrumb(t('locations.new.breadcrumb'))
    @location = authorize policy_scope(Location).new(location_params)
    if @location.save
      flash[:notice] = t('.controller.create')
      redirect_to @location
    else
      render 'new'
    end
  end

  def update
    add_breadcrumb(@location.name, location_path(@location))
    add_breadcrumb(t('locations.edit.breadcrumb'))
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
    @location = authorize policy_scope(Location).find(params[:id])
  end

  def location_params
    params.require(:location).permit(:name, :address, :latitude, :longitude)
  end
end
