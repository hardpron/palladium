class SetResultsController < ApplicationController
  before_action :set_set_result, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /set_results
  # GET /set_results.json
  def index
    @set_results = SetResult.all
  end

  # GET /set_results/1
  # GET /set_results/1.json
  def show
  end

  # GET /set_results/new
  def new
    @set_result = SetResult.new
  end

  # GET /set_results/1/edit
  def edit
  end

  # POST /set_results
  # POST /set_results.json
  def create
    @set_result = SetResult.new(set_result_params)

    respond_to do |format|
      if @set_result.save
        format.html { redirect_to @set_result, notice: 'Set result was successfully created.' }
        format.json { render :show, status: :created, location: @set_result }
      else
        format.html { render :new }
        format.json { render json: @set_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /set_results/1
  # PATCH/PUT /set_results/1.json
  def update
    respond_to do |format|
      if @set_result.update(set_result_params)
        format.html { redirect_to @set_result, notice: 'Set result was successfully updated.' }
        format.json { render :show, status: :ok, location: @set_result }
      else
        format.html { render :edit }
        format.json { render json: @set_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /set_results/1
  # DELETE /set_results/1.json
  def destroy
    @set_result.destroy
    respond_to do |format|
      format.html { redirect_to set_results_url, notice: 'Set result was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_set_result
      @set_result = SetResult.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def set_result_params
      params[:set_result]
    end
end
