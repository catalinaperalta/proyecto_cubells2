class CursarsController < ApplicationController
  before_action :set_cursar, only: [:show, :edit, :update, :destroy]

  # GET /cursars
  # GET /cursars.json
  def index
    @cursars = Cursar.all
  end

  # GET /cursars/1
  # GET /cursars/1.json
  def show
  end

  # GET /cursars/new
  def new
    @cursar = Cursar.new
  end

  # GET /cursars/1/edit
  def edit
  end

  # POST /cursars
  # POST /cursars.json
  def create
    @cursar = Cursar.new(cursar_params)

    respond_to do |format|
      if @cursar.save
        format.html { redirect_to @cursar, notice: 'Cursar was successfully created.' }
        format.json { render :show, status: :created, location: @cursar }
      else
        format.html { render :new }
        format.json { render json: @cursar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cursars/1
  # PATCH/PUT /cursars/1.json
  def update
    respond_to do |format|
      if @cursar.update(cursar_params)
        format.html { redirect_to @cursar, notice: 'Cursar was successfully updated.' }
        format.json { render :show, status: :ok, location: @cursar }
      else
        format.html { render :edit }
        format.json { render json: @cursar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cursars/1
  # DELETE /cursars/1.json
  def destroy
    @cursar.destroy
    respond_to do |format|
      format.html { redirect_to cursars_url, notice: 'Cursar was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cursar
      @cursar = Cursar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cursar_params
      params.require(:cursar).permit(:matricula, :codma, :fecha)
    end
end
