class RunsController < ApplicationController
  before_action :set_run, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /runs
  # GET /runs.json
  def index
    @runs = Product.find(product_find_by_id).plans.find(params.require(:plan_id)).runs
  end

  # GET /runs/1
  # GET /runs/1.json
  def show
  end

  # GET /runs/new
  def new
    @product = product_find_by_id
    @plan = plan_find_by_id
    @run = Run.new
  end

  # GET /runs/1/edit
  def edit
    @product = product_find_by_id
    @plan = plan_find_by_id
    @run = set_run
  end

  # POST /runs
  # POST /runs.json
  def create
    @run = Run.new(run_params)

    respond_to do |format|
      if @run.save
        Product.find(params.require(:product_id)).plans.find(params.require(:plan_id)).runs << @run
        format.html { redirect_to product_plan_run_path(product_find_by_id, plan_find_by_id, @run), notice: 'Run was successfully created.' }
        format.json { render :show, status: :created, location: @run }
      else
        format.html { render :new }
        format.json { render json: @run.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /runs/1
  # PATCH/PUT /runs/1.json
  def update
    respond_to do |format|
      if @run.update(run_params)
        format.html { redirect_to action: "show", id: set_run, notice: 'Run was successfully updated.' }
        format.json { render :show, status: :ok, location: @run }
      else
        format.html { render :edit }
        format.json { render json: @run.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /runs/1
  # DELETE /runs/1.json
  def destroy
    @plan = @product.plans.find(params.require(:plan_id))
    @run.destroy
    respond_to do |format|
      format.html { redirect_to action: "index", notice: 'Run was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_run
      @run = Run.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def run_params
      params.require(:run).permit(:name, :version)
    end

   def product_find_by_id
     Product.find(params.require(:product_id))
   end

  def plan_find_by_id
     Product.find(product_find_by_id).plans.find(params.require(:plan_id))
   end
end
