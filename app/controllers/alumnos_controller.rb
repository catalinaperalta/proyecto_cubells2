class AlumnosController < ApplicationController
  before_action :logged_in_alumno, only: [:set_alumno, :show, :edit, :update, :destroy, :boleta]
  before_action :correct_alumno, only: [:show, :edit, :update, :destroy, :boleta]

  # GET /alumnos
  # GET /alumnos.json
  def index
    @alumnos = Alumno.all
    @materias = Curso.select("cursos.nombre, alumnos.matricula").joins("JOIN materia_alumnos ON materia_alumnos.materia_id  = cursos.id JOIN alumnos ON alumnos.id = materia_alumnos.alumno_id JOIN profesors.id = cursos.profesor");
  end

  # GET /alumnos/1
  # GET /alumnos/1.json
  def show
        @materias = Curso.select("cursos.*, profesors.nombre as profe, profesors.apellido as profap, materia_alumnos.id as ma").joins("JOIN materia_alumnos ON materia_alumnos.materia_id = cursos.id JOIN alumnos ON alumnos.id = materia_alumnos.alumno_id JOIN profesors ON profesors.id = cursos.profesor").where("alumnos.id = ?", params[:id]);
        @alumno = Alumno.find(params[:id]);
        @clase = Curso.select("cursos.*, materia_alumnos.id").joins("JOIN materia_alumnos ON materia_alumnos.materia_id = cursos.id JOIN alumnos ON alumnos.id = materia_alumnos.alumno_id").where("alumno.id = ?", params[:id]);
        @ma = Curso.select("materia_alumnos.id").joins("JOIN materia_alumnos ON materia_alumnos.materia_id = cursos.id JOIN alumnos ON alumnos.id = materia_alumnos.alumno_id").where("alumno.id = ?, ", params[:id]);
  end

  def boleta
    @alumno = Alumno.find(params[:id]);
    @parcial = Parcial.select("parcials.*, materia_alumnos.materia_id as materia").joins("JOIN materia_alumnos ON materia_alumnos.id = parcials.id_materia_alumno").where("materia_alumnos.alumno_id = ?", params[:id]);
    @semestre = MateriaCarrera.select("materia_carreras.semestre as numero, materia_carreras.materia_id").joins("JOIN alumnos ON alumnos.id_carrera = materia_carreras.carrera_id").where("alumnos.id = ?", params[:id]).uniq;
    # @semestre = MateriaCarrera.select("materia_carreras.semestre as numero").joins("JOIN cursos ON materia_carreras.materia_id = cursos.id JOIN materia_alumnos ON materia_alumnos.materia_id = cursos.id JOIN alumnos ON materia_carreras.carrera_id = alumnos.id_carrera").where("alumnos.id = ?", params[:id]);
    @materia = MateriaAlumno.select("materia_alumnos.id as ma_id, cursos.nombre as materia, materia_carreras.semestre as numero").joins("JOIN materia_carreras ON materia_carreras.materia_id = materia_alumnos.materia_id JOIN cursos ON cursos.id = materia_carreras.materia_id JOIN carreras ON carreras.id = materia_carreras.carrera_id JOIN alumnos ON alumnos.id = materia_alumnos.alumno_id").where("alumnos.id_carrera = carreras.id AND alumnos.id = ?", params[:id]);
    
  end

  def homepage
  #  @user = Alumno.find_by(matricula: params[:matricula])
  #  @materias = Curso.select("cursos.nombre, alumnos.matricula, profesors.nombre").joins("JOIN materia_alumnos ON materia_alumnos.materia_id  = cursos.id JOIN alumnos ON alumnos.id = materia_alumnos.alumno_id JOIN materia_profesors ON materia_profesors.materia_id = cursos.id JOIN profesors ON profesors.id = materia_profesors.profesor_id");
    @materias = Curso.select(cursos.*).joins("JOIN materia_alumnos ON materia_alumnos.materia_id = cursos.id JOIN (SELECT id from alumnos) ON alumnos.id = materia_alumnos.alumno_id");

  end

  def materiasAlumno
  #  @user = Alumno.find_by(matricula: params[:matricula])
   @materias = Curso.select("cursos.*, profesors.nombre").joins("JOIN materia_alumnos ON materia_alumnos.materia_id  = cursos.id JOIN alumnos ON alumnos.id = materia_alumnos.alumno_id JOIN profesors ON profesors.id = cursos.profesor").where("alumnos.id = ?", params[:id]);
  #  @s = Curso.select("cursos.nombre as curso, profesors.nombre").joins("JOIN materia_alumnos ON materia_alumnos.materia_id  = cursos.id JOIN alumnos ON alumnos.id = materia_alumnos.alumno_id JOIN materia_profesors ON materia_profesors.materia_id = cursos.id JOIN profesors ON profesors.id = materia_profesors.profesor_id");
   #@alumnos = Alumno.all
   # @s = Curso.select("cursos.nombre as curso, alumnos.nombre as alumno").joins("materia_alumnos on cursos.id = materia_alumnos.materia_id join alumnos on alumnos.id = materia_alumnos.alumno_id join materia_profesors on materia_profesors.materia_id = cursos.id join profesors on profesors.id = materia_profesors.profesor_id");
    @materias = Curso.select("cursos.*, profesors.nombre as profesor").joins("JOIN materia_alumnos ON materia_alumnos.materia_id = cursos.id JOIN alumnos ON alumnos.id = materia_alumnos.alumno_id JOIN profesors ON profesors.id = cursos.profesor").where("alumnos.id = ?", params[:id]);
    @alumno = Alumno.find(params[:id])
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


  def logged_in_alumno
    unless alumno_logged_in?
      redirect_to '/'
    end
  end

  def correct_alumno
    @user = Alumno.find_by(id: params[:id])
    redirect_to current_alumno unless @user == current_alumno
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_alumno
      @alumno = Alumno.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def alumno_params
      params.require(:alumno).permit(:matricula, :nombre, :apellido_p, :apellido_m, :edad, :fecha_ingreso, :password, :id_carrera)
    end
end
