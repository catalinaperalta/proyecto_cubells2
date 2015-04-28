class AlumnosController < ApplicationController
  before_action :set_alumno, only: [:show, :edit, :update, :destroy]

  # GET /alumnos
  # GET /alumnos.json
  def index
    @alumnos = Alumno.all
    @materias = Curso.select("cursos.nombre, alumnos.matricula").joins("JOIN materia_alumnos ON materia_alumnos.materia_id  = cursos.id JOIN alumnos ON alumnos.id = materia_alumnos.alumno_id JOIN materia_profesors ON materia_profesors.materia_id = cursos.id JOIN profesors ON profesors.id = materia_profesors.profesor_id");
  end

  # GET /alumnos/1
  # GET /alumnos/1.json
  def show
        @materias = Curso.select("cursos.*, profesors.nombre as profesor").joins("JOIN materia_alumnos ON materia_alumnos.materia_id = cursos.id JOIN alumnos ON alumnos.id = materia_alumnos.alumno_id JOIN materia_profesors ON materia_profesors.materia_id = cursos.id JOIN profesors ON profesors.id = materia_profesors.profesor_id").where("alumnos.id = ?", params[:id]);
        @alumno = Alumno.find(params[:id])
  end

  def homepage
  #  @user = Alumno.find_by(matricula: params[:matricula])
  #  @materias = Curso.select("cursos.nombre, alumnos.matricula, profesors.nombre").joins("JOIN materia_alumnos ON materia_alumnos.materia_id  = cursos.id JOIN alumnos ON alumnos.id = materia_alumnos.alumno_id JOIN materia_profesors ON materia_profesors.materia_id = cursos.id JOIN profesors ON profesors.id = materia_profesors.profesor_id");
    @materias = Curso.select(cursos.*).joins("JOIN materia_alumnos ON materia_alumnos.materia_id = cursos.id JOIN (SELECT id from alumnos) ON alumnos.id = materia_alumnos.alumno_id");

  end

  def materiasAlumno
  #  @user = Alumno.find_by(matricula: params[:matricula])
  #  @materias = Curso.select("cursos.nombre, alumnos.matricula, profesors.nombre").joins("JOIN materia_alumnos ON materia_alumnos.materia_id  = cursos.id JOIN alumnos ON alumnos.id = materia_alumnos.alumno_id JOIN materia_profesors ON materia_profesors.materia_id = cursos.id JOIN profesors ON profesors.id = materia_profesors.profesor_id");
  #  @s = Curso.select("cursos.nombre as curso, profesors.nombre").joins("JOIN materia_alumnos ON materia_alumnos.materia_id  = cursos.id JOIN alumnos ON alumnos.id = materia_alumnos.alumno_id JOIN materia_profesors ON materia_profesors.materia_id = cursos.id JOIN profesors ON profesors.id = materia_profesors.profesor_id");
   @alumnos = Alumno.all
   # @s = Curso.select("cursos.nombre as curso, alumnos.nombre as alumno").joins("materia_alumnos on cursos.id = materia_alumnos.materia_id join alumnos on alumnos.id = materia_alumnos.alumno_id join materia_profesors on materia_profesors.materia_id = cursos.id join profesors on profesors.id = materia_profesors.profesor_id");
  end
  
  # GET /alumnos/new
  def new
    @alumno = Alumno.new
  end

  # GET /alumnos/1/edit
  def edit
  end

  # POST /alumnos
  # POST /alumnos.json
  def create
    @alumno = Alumno.new(alumno_params)

    respond_to do |format|
      if @alumno.save
        format.html { redirect_to @alumno, notice: 'Alumno was successfully created.' }
        format.json { render :show, status: :created, location: @alumno }
      else
        format.html { render :new }
        format.json { render json: @alumno.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /alumnos/1
  # PATCH/PUT /alumnos/1.json
  def update
    respond_to do |format|
      if @alumno.update(alumno_params)
        format.html { redirect_to @alumno, notice: 'Alumno was successfully updated.' }
        format.json { render :show, status: :ok, location: @alumno }
      else
        format.html { render :edit }
        format.json { render json: @alumno.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /alumnos/1
  # DELETE /alumnos/1.json
  def destroy
    @alumno.destroy
    respond_to do |format|
      format.html { redirect_to alumnos_url, notice: 'Alumno was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_alumno
      @alumno = Alumno.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def alumno_params
      params.require(:alumno).permit(:matricula, :nombre, :apellido_p, :apellido_m, :edad, :fecha_ingreso, :password, :id_carrera)
    end
end
