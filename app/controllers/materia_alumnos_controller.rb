class MateriaAlumnosController < ApplicationController
  before_action :set_materia_alumno, only: [:show, :edit, :update, :destroy]

  # GET /materia_alumnos
  # GET /materia_alumnos.json
  def index
    @materia_alumnos = MateriaAlumno.all
  end

  # GET /materia_alumnos/1
  # GET /materia_alumnos/1.json
  def show
    @materia = Curso.select("cursos.*").joins("JOIN materia_alumnos ON materia_alumnos.materia_id = cursos.id ").where("materia_alumnos.id = ?", params[:id]);
    @alumno = Alumno.select("alumnos.*").joins("JOIN materia_alumnos ON materia_alumnos.alumno_id = alumnos.id ").where("materia_alumnos.id = ?", params[:id]);
    @materia_alumno = MateriaAlumno.find(params[:id]);
    @parcial = Parcial.select("parcials.*").where("id_materia_alumno = ?", params[:id]).order(numero: :asc);
    @actividad = Actividad.select("actividads.*").joins("JOIN parcials ON parcials.id = actividads.id_parcial JOIN materia_alumnos ON materia_alumnos.id = parcials.id_materia_alumno").where("materia_alumnos.id = ?", params[:id]);
  end

  # GET /materia_alumnos/new
  def new
    @materia_alumno = MateriaAlumno.new
  end

  # GET /materia_alumnos/1/edit
  def edit
  end

  # POST /materia_alumnos
  # POST /materia_alumnos.json
  def create
    @materia_alumno = MateriaAlumno.new(materia_alumno_params)

    respond_to do |format|
      if @materia_alumno.save
        format.html { redirect_to @materia_alumno, notice: 'Materia alumno was successfully created.' }
        format.json { render :show, status: :created, location: @materia_alumno }
      else
        format.html { render :new }
        format.json { render json: @materia_alumno.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /materia_alumnos/1
  # PATCH/PUT /materia_alumnos/1.json
  def update
    respond_to do |format|
      if @materia_alumno.update(materia_alumno_params)
        format.html { redirect_to @materia_alumno, notice: 'Materia alumno was successfully updated.' }
        format.json { render :show, status: :ok, location: @materia_alumno }
      else
        format.html { render :edit }
        format.json { render json: @materia_alumno.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /materia_alumnos/1
  # DELETE /materia_alumnos/1.json
  def destroy
    @materia_alumno.destroy
    respond_to do |format|
      format.html { redirect_to materia_alumnos_url, notice: 'Materia alumno was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_materia_alumno
      @materia_alumno = MateriaAlumno.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def materia_alumno_params
      params.require(:materia_alumno).permit(:materia_id, :alumno_id, :fecha)
    end

    def materia_alumno_nuevo_params
      params.require(:materia_alumno).permit(:materia_codma, :alumno_matricula, :fecha)
    end
end
