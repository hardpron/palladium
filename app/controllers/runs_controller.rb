class RunsController < ApplicationController
  before_action :set_run, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /runs
  # GET /runs.json
  def index
    @runs = Run.all
  end

  # GET /runs/1
  # GET /runs/1.json
  def show
  end

  # GET /runs/new
  def new
    @run = Run.new
    @product_id = params.require('product_id')
  end

  # GET /runs/1/edit
  def edit
  end

  # POST /runs
  # POST /runs.json
  def create
    @run = Run.new(run_params)
    respond_to do |format|
      if @run.save
        format.html { redirect_to @run, notice: 'Run was successfully created.' }
        format.json { render :show, status: :created, location: @run }
        Product.find(params.require(:run)[:product_id]).runs << @run
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
        format.html { redirect_to @run, notice: 'Run was successfully updated.' }
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
    puts '
         ████████████████████████████████████████████
         █────█────█─███─███────█────██───█─█─█─███─█
         █─██─█─██─█─███─███─██─█─██──██─██─█─█──█──█
         █────█────█─███─███────█─██──██─██─█─█─█─█─█
         █─████─██─█─███─███─██─█─██──██─██─█─█─███─█
         █─████─██─█───█───█─██─█────██───█───█─███─█
         ████████████████████████████████████████████
          '
    respond_to do |format|
      format.html { redirect_to product_path(@run.products.first),  notice: 'Run was successfully destroyed.' }
      format.json { head :no_content }
    end
    @run.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_run
    @run = Run.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def run_params
    params.require(:run).permit(:date, :version, :status)
  end
end
