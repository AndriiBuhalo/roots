# frozen_string_literal: true

class ImportantDatesController < DashboardController
  before_action :set_important_date, only: %i[show edit update destroy]

  def index
    add_breadcrumb(t('important_dates.index.breadcrumb'))
    @important_dates = authorize collection.paginate(page: params[:page])
  end

  def show
    add_breadcrumb(@important_date.event_name)
  end

  def new
    add_breadcrumb(t('important_dates.new.breadcrumb'))
    @important_date = collection.new
  end

  def edit
    add_breadcrumb(@important_date.event_name, important_date_path(@important_date))
    add_breadcrumb(t('important_dates.edit.breadcrumb'))
  end

  def create
    add_breadcrumb(t('important_dates.new.breadcrumb'))
    @important_date = authorize collection.new(important_date_params)
    if @important_date.save
      flash[:notice] = t('.controller.create')
      redirect_to @important_date
    else
      render 'new'
    end
  end

  def update
    add_breadcrumb(@important_date.event_name, important_date_path(@important_date))
    add_breadcrumb(t('important_dates.edit.breadcrumb'))
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
    policy_scope(ImportantDate)
  end

  def set_important_date
    @important_date = authorize collection.find(params[:id])
  end

  def important_date_params
    params.require(:important_date).permit(:event_name, :event_date, :description)
  end
end
