class ResultsController < ApplicationController
  before_action :set_result, only: [:show, :edit, :update, :destroy]
  acts_as_token_authentication_handler_for User

  # GET /results
  # GET /results.json
  def index
    @results = Product.find(product_find_by_id).plans.find(params.require(:plan_id)).runs.find(params.require(:run_id)).result_sets.find(params.require(:result_set_id)).results
  end

  # GET /results/1
  # GET /results/1.json
  def show
  end

  # GET /results/new
  def new
    @result = Result.new
    @product = product_find_by_id
    @plan = set_plan
    @run = set_run
    @result_set = set_result_set
  end

  # GET /results/1/edit
  def edit
    @product = product_find_by_id
    @plan = set_plan
    @run = set_run
    @result_set = set_result_set
  end

  # POST /results
  # POST /results.json
  def create
    @result = Result.new(result_params)
    Status.find_by_main_status(true).results << @result
    respond_to do |format|
      if @result.save
        set_result_set.results << @result
        format.html { redirect_to product_plan_run_result_set_result_path(product_find_by_id, set_plan, set_run, set_result_set, @result), notice: 'Result was successfully created.' }
        format.json { render :show, status: :created, location: @result }
      else
        format.html { render :new }
        format.json { render json: @result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /results/1
  # PATCH/PUT /results/1.json
  def update
    respond_to do |format|
      if @result.update(result_params)
        format.html { redirect_to product_plan_run_result_set_result_path(product_find_by_id, set_plan, set_run, set_result_set, @result), notice: 'Result was successfully updated.' }
        format.json { render :show, status: :ok, location: @result }
      else
        format.html { render :edit }
        format.json { render json: @result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /results/1
  # DELETE /results/1.json
  def destroy
    @result.destroy
    respond_to do |format|
      format.html { redirect_to action: "index", notice: 'Result was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_result
      @result = Result.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def result_params
      params.require(:result).permit(:status, :message, :author)
    end

  def set_run
    @run = Run.find(params[:run_id])
  end

  def set_plan
    @plan = Plan.find(params[:plan_id])
  end

  def product_find_by_id
    Product.find(params.require(:product_id))
  end

  def set_result_set
    @result_set = ResultSet.find(params[:result_set_id])
  end
end
