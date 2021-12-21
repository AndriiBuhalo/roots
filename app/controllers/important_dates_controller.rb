# frozen_string_literal: true

class ImportantDatesController < DashboardController
  before_action :set_important_date, only: %i[show edit update destroy]

  def index
    @important_dates = collection
  end

  def show; end

  def new
    @important_date = collection.new
  end

  def edit; end

  def create
    @important_date = collection.new(important_date_params)
    if @important_date.save
      flash[:notice] = t('.controller.create')
      redirect_to @important_date
    else
      render 'new'
    end
  end

  def update
    if @important_date.update(important_date_params)
      flash[:notice] = t('.controller.update')
      redirect_to @important_date
    else
      render 'edit'
    end
  end

  def destroy
    @important_date.destroy
    flash[:notice] = t('.controller.destroy')
    redirect_to important_dates_url
  end

  private

  def collection
    ImportantDate.by_user(current_user)
  end

  def set_important_date
    @important_date = collection.find(params[:id])
  end

  def important_date_params
    params.require(:important_date).permit(:event_name, :event_date, :description)
  end
end