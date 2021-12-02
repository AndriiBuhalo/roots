class ImportantDatesController < ApplicationController
  before_action :set_important_date, only: %i[ show edit update destroy ]

  # GET /important_dates or /important_dates.json
  def index
    @important_dates = ImportantDate.all
  end

  # GET /important_dates/1 or /important_dates/1.json
  def show
  end

  # GET /important_dates/new
  def new
    @important_date = ImportantDate.new
  end

  # GET /important_dates/1/edit
  def edit
  end

  # POST /important_dates or /important_dates.json
  def create
    @important_date = ImportantDate.new(important_date_params)

    respond_to do |format|
      if @important_date.save
        format.html { redirect_to @important_date, notice: "Important date was successfully created." }
        format.json { render :show, status: :created, location: @important_date }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @important_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /important_dates/1 or /important_dates/1.json
  def update
    respond_to do |format|
      if @important_date.update(important_date_params)
        format.html { redirect_to @important_date, notice: "Important date was successfully updated." }
        format.json { render :show, status: :ok, location: @important_date }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @important_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /important_dates/1 or /important_dates/1.json
  def destroy
    @important_date.destroy
    respond_to do |format|
      format.html { redirect_to important_dates_url, notice: "Important date was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_important_date
      @important_date = ImportantDate.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def important_date_params
      params.require(:important_date).permit(:event, :event_date, :description)
    end
end
