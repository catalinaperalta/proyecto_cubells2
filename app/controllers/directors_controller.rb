class DirectorsController < ApplicationController
  before_action :logged_in_director, only: [:set_director, :show, :edit, :update, :destroy]
  before_action :correct_director, only: [:show, :edit, :update, :destroy]

  # GET /directors
  # GET /directors.json
  def index
    @directors = Director.all
  end

  # GET /directors/1
  # GET /directors/1.json
  def show
    @director = Director.find(params[:id])
    @numero_alumnos = Alumno.count(:conditions => ["carrera.id_director = ?", params[:id]], :joins => "JOIN carreras ON carreras.id = alumnos.id_carrera")
    @numero_materias = MateriaCarrera.count(:conditions => ["carreras.id_director = ?", params[:id]], :joins => "JOIN carreras ON carreras.id = materia_carreras.carrera_id")
  end

  def listaa
    @director = Director.find(params[:id])
    @carrera = Carrera.find_by id_director: params[:id]
    @alumnos = Alumno.select("alumnos.*").joins("JOIN carreras ON carreras.id = alumnos.id_carrera JOIN directors ON carreras.id_director = directors.id").where("directors.id = ?", params[:id])
  end

  def listam
    @director = Director.find(params[:id])
    @carrera = Carrera.find_by id_director: params[:id]
    @materias = Curso.select("cursos.*, profesors.nombre as prof_name").joins("JOIN materia_carreras ON materia_carreras.materia_id = cursos.id JOIN carreras ON materia_carreras.carrera_id = carreras.id JOIN directors ON directors.id = carreras.id_director JOIN profesors ON profesors.id = cursos.profesor").where("directors.id = ?", params[:id])
  end

  # GET /directors/new
  def new
    @director = Director.new
  end

  # GET /directors/1/edit
  def edit
  end

  # POST /directors
  # POST /directors.json
  def create
    @director = Director.new(director_params)

    respond_to do |format|
      if @director.save
        format.html { redirect_to @director, notice: 'Director was successfully created.' }
        format.json { render :show, status: :created, location: @director }
      else
        format.html { render :new }
        format.json { render json: @director.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /directors/1
  # PATCH/PUT /directors/1.json
  def update
    respond_to do |format|
      if @director.update(director_params)
        format.html { redirect_to @director, notice: 'Director was successfully updated.' }
        format.json { render :show, status: :ok, location: @director }
      else
        format.html { render :edit }
        format.json { render json: @director.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /directors/1
  # DELETE /directors/1.json
  def destroy
    @director.destroy
    respond_to do |format|
      format.html { redirect_to directors_url, notice: 'Director was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private


  def logged_in_director
    unless director_logged_in?
      redirect_to root_url
    end
  end

  def correct_director
    @user = Director.find_by(id: params[:id])
    redirect_to(root_url) unless @user == current_director
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_director
      @director = Director.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def director_params
      params.require(:director).permit(:coddr, :nombre, :password)
    end
end
