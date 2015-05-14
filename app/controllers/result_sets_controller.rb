class ResultSetsController < ApplicationController
  before_action :set_result_set, only: [:show, :edit, :update, :destroy]

  # GET /result_sets
  # GET /result_sets.json
  def index
    @result_sets = Product.find(product_find_by_id).plans.find(params.require(:plan_id)).runs.find(params.require(:run_id)).result_sets
  end

  # GET /result_sets/1
  # GET /result_sets/1.json
  def show
  end

  # GET /result_sets/new
  def new
    @result_set = ResultSet.new
    @product = product_find_by_id
    @plan = set_plan
    @run = set_run
  end

  # GET /result_sets/1/edit
  def edit
    @result_set = set_result_set
    @product = product_find_by_id
    @plan = set_plan
    @run = set_run
  end

  # POST /result_sets
  # POST /result_sets.json
  def create
    @result_set = ResultSet.new(result_set_params)

    respond_to do |format|
      if @result_set.save
        set_run.result_sets << @result_set
        format.html { redirect_to product_plan_run_result_set_path(product_find_by_id, set_plan, set_run, @result_set), notice: 'Result set was successfully created.' }
        format.json { render :show, status: :created, location: @result_set }
      else
        format.html { render :new }
        format.json { render json: @result_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /result_sets/1
  # PATCH/PUT /result_sets/1.json
  def update
    respond_to do |format|
      if @result_set.update(result_set_params)
        format.html { redirect_to product_plan_run_result_set_path(product_find_by_id, set_plan, set_run, @result_set), notice: 'Result set was successfully updated.' }
        format.json { render :show, status: :ok, location: @result_set }
      else
        format.html { render :edit }
        format.json { render json: @result_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /result_sets/1
  # DELETE /result_sets/1.json
  def destroy
    @result_set.destroy
    respond_to do |format|
      format.html { redirect_to product_plan_run_result_sets_path(product_find_by_id, set_plan, set_run), notice: 'Result set was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_result_set
      @result_set = ResultSet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def result_set_params
      params.require(:result_set).permit(:name, :date, :version, :status)
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
end
