class DataIndicatorsController < ApplicationController
  before_action :set_data_indicator, only: [:show, :edit, :update, :destroy]

  # GET /data_indicators
  # GET /data_indicators.json
  def index
    @data_indicators = DataIndicator.all
  end

  # GET /data_indicators/1
  # GET /data_indicators/1.json
  def show
  end

  # GET /data_indicators/new
  def new
    @data_indicator = DataIndicator.new
  end

  # GET /data_indicators/1/edit
  def edit
  end

  # POST /data_indicators
  # POST /data_indicators.json
  def create
    @data_indicator = DataIndicator.new(data_indicator_params)

    respond_to do |format|
      if @data_indicator.save
        format.html { redirect_to @data_indicator, notice: 'Data indicator was successfully created.' }
        format.json { render :show, status: :created, location: @data_indicator }
      else
        format.html { render :new }
        format.json { render json: @data_indicator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /data_indicators/1
  # PATCH/PUT /data_indicators/1.json
  def update
    respond_to do |format|
      if @data_indicator.update(data_indicator_params)
        format.html { redirect_to @data_indicator, notice: 'Data indicator was successfully updated.' }
        format.json { render :show, status: :ok, location: @data_indicator }
      else
        format.html { render :edit }
        format.json { render json: @data_indicator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /data_indicators/1
  # DELETE /data_indicators/1.json
  def destroy
    @data_indicator.destroy
    respond_to do |format|
      format.html { redirect_to data_indicators_url, notice: 'Data indicator was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_data_indicator
      @data_indicator = DataIndicator.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def data_indicator_params
      params.require(:data_indicator).permit(:federal_entity, :main_category, :category, :subcategory, :indicator, :year, :unit_of_measurement)
    end
end
