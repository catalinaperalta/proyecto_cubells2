class MateriaCarrerasController < ApplicationController
  before_action :set_materia_carrera, only: [:show, :edit, :update, :destroy]

  # GET /materia_carreras
  # GET /materia_carreras.json
  def index
    @materia_carreras = MateriaCarrera.all
  end

  # GET /materia_carreras/1
  # GET /materia_carreras/1.json
  def show
  end

  # GET /materia_carreras/new
  def new
    @materia_carrera = MateriaCarrera.new
  end

  # GET /materia_carreras/1/edit
  def edit
  end

  # POST /materia_carreras
  # POST /materia_carreras.json
  def create
    @materia_carrera = MateriaCarrera.new(materia_carrera_params)

    respond_to do |format|
      if @materia_carrera.save
        format.html { redirect_to @materia_carrera, notice: 'Materia carrera was successfully created.' }
        format.json { render :show, status: :created, location: @materia_carrera }
      else
        format.html { render :new }
        format.json { render json: @materia_carrera.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /materia_carreras/1
  # PATCH/PUT /materia_carreras/1.json
  def update
    respond_to do |format|
      if @materia_carrera.update(materia_carrera_params)
        format.html { redirect_to @materia_carrera, notice: 'Materia carrera was successfully updated.' }
        format.json { render :show, status: :ok, location: @materia_carrera }
      else
        format.html { render :edit }
        format.json { render json: @materia_carrera.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /materia_carreras/1
  # DELETE /materia_carreras/1.json
  def destroy
    @materia_carrera.destroy
    respond_to do |format|
      format.html { redirect_to materia_carreras_url, notice: 'Materia carrera was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_materia_carrera
      @materia_carrera = MateriaCarrera.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def materia_carrera_params
      params.require(:materia_carrera).permit(:materia_id, :carrera_id, :semestre)
    end
end
