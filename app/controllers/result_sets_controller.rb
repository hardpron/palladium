class ResultSetsController < ApplicationController
  before_action :set_result_set, only: [:show, :edit, :update, :destroy]

  # GET /result_sets
  # GET /result_sets.json
  def index
    @result_sets = ResultSet.all
  end

  # GET /result_sets/1
  # GET /result_sets/1.json
  def show
  end

  # GET /result_sets/new
  def new
    @result_set = ResultSet.new
  end

  # GET /result_sets/1/edit
  def edit
  end

  # POST /result_sets
  # POST /result_sets.json
  def create
    @result_set = ResultSet.new(result_set_params)

    respond_to do |format|
      if @result_set.save
        format.html { redirect_to @result_set, notice: 'Result set was successfully created.' }
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
        format.html { redirect_to @result_set, notice: 'Result set was successfully updated.' }
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
      format.html { redirect_to result_sets_url, notice: 'Result set was successfully destroyed.' }
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
      params.require(:result_set).permit(:status, :version)
    end
end
