class MateriaProfesorsController < ApplicationController
  before_action :set_materia_profesor, only: [:show, :edit, :update, :destroy]

  # GET /materia_profesors
  # GET /materia_profesors.json
  def index
    @materia_profesors = MateriaProfesor.all
  end

  # GET /materia_profesors/1
  # GET /materia_profesors/1.json
  def show
  end

  # GET /materia_profesors/new
  def new
    @materia_profesor = MateriaProfesor.new
  end

  # GET /materia_profesors/1/edit
  def edit
  end

  # POST /materia_profesors
  # POST /materia_profesors.json
  def create
    @materia_profesor = MateriaProfesor.new(materia_profesor_params)

    respond_to do |format|
      if @materia_profesor.save
        format.html { redirect_to @materia_profesor, notice: 'Materia profesor was successfully created.' }
        format.json { render :show, status: :created, location: @materia_profesor }
      else
        format.html { render :new }
        format.json { render json: @materia_profesor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /materia_profesors/1
  # PATCH/PUT /materia_profesors/1.json
  def update
    respond_to do |format|
      if @materia_profesor.update(materia_profesor_params)
        format.html { redirect_to @materia_profesor, notice: 'Materia profesor was successfully updated.' }
        format.json { render :show, status: :ok, location: @materia_profesor }
      else
        format.html { render :edit }
        format.json { render json: @materia_profesor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /materia_profesors/1
  # DELETE /materia_profesors/1.json
  def destroy
    @materia_profesor.destroy
    respond_to do |format|
      format.html { redirect_to materia_profesors_url, notice: 'Materia profesor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_materia_profesor
      @materia_profesor = MateriaProfesor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def materia_profesor_params
      params.require(:materia_profesor).permit(:materia_id, :profesor_id)
    end
end
