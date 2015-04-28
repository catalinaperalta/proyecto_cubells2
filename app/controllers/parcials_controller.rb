class ParcialsController < ApplicationController
  before_action :set_parcial, only: [:show, :edit, :update, :destroy]

  # GET /parcials
  # GET /parcials.json
  def index
    @parcials = Parcial.all
  end

  # GET /parcials/1
  # GET /parcials/1.json
  def show
  end

  # GET /parcials/new
  def new
    @parcial = Parcial.new
  end

  # GET /parcials/1/edit
  def edit
  end

  # POST /parcials
  # POST /parcials.json
  def create
    @parcial = Parcial.new(parcial_params)

    respond_to do |format|
      if @parcial.save
        format.html { redirect_to @parcial, notice: 'Parcial was successfully created.' }
        format.json { render :show, status: :created, location: @parcial }
      else
        format.html { render :new }
        format.json { render json: @parcial.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parcials/1
  # PATCH/PUT /parcials/1.json
  def update
    respond_to do |format|
      if @parcial.update(parcial_params)
        format.html { redirect_to @parcial, notice: 'Parcial was successfully updated.' }
        format.json { render :show, status: :ok, location: @parcial }
      else
        format.html { render :edit }
        format.json { render json: @parcial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parcials/1
  # DELETE /parcials/1.json
  def destroy
    @parcial.destroy
    respond_to do |format|
      format.html { redirect_to parcials_url, notice: 'Parcial was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parcial
      @parcial = Parcial.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def parcial_params
      params.require(:parcial).permit(:numero, :calificacion, :id_materia_alumno)
    end
end
