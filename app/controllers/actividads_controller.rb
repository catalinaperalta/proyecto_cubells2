class ActividadsController < ApplicationController
  before_action :set_actividad, only: [:show, :edit, :update, :destroy]
  before_action :profesor_activo, only: [:edit, :update, :destroy]

  # GET /actividads
  # GET /actividads.json
  def index
    @actividads = Actividad.all
  end

  # GET /actividads/1
  # GET /actividads/1.json
  def show
  end

  def agregar
    poner_materia params[:id]
    @actividad = Actividad.new

  end

  # GET /actividads/new
  def new
    @actividad = Actividad.new
  end

  # GET /actividads/1/edit
  def edit
    @profesor = Profesor.select("profesors.*").joins("JOIN cursos ON profesors.id = cursos.profesor JOIN materia_alumnos ON materia_alumnos.materia_id = cursos.id JOIN parcials ON parcials.id_materia_alumno = materia_alumnos.id JOIN actividads ON actividads.id_parcial = parcials.id").where("actividads.id = ?", params[:id]).first
  end

  # POST /actividads
  # POST /actividads.json
  def create
    @parcials = Parcial.select("parcials.*").joins("JOIN materia_alumnos ON parcials.id_materia_alumno = materia_alumnos.id JOIN cursos ON cursos.id = materia_alumnos.materia_id").where("cursos.id = ? AND parcials.numero = ?", current_materia.id, params[:numero])

    @parcials.each do |c|
      params[:actividad][:id_parcial] = c.id
      params[:actividad][:calificacion] = 0
      @actividad = Actividad.new(actividad_params)
      @actividad.save
    end
    redirect_to current_profesor and return
  end

  # PATCH/PUT /actividads/1
  # PATCH/PUT /actividads/1.json
  def update
    # @ma = MateriaAlumno.select("materia_alumnos.*").joins("JOIN parcial ON parcials.id_materia_alumno = materia_alumnos.id JOIN actividads ON actividads.id_parcial = parcials.id").where("actividads.id = ?", params[:id])
    @mat_al = MateriaAlumno.select("materia_alumnos.id").joins("JOIN parcials ON parcials.id_materia_alumno = materia_alumnos.id JOIN actividads ON actividads.id_parcial = parcials.id").where("actividads.id = ?", params[:id]).first
    respond_to do |format|
      if @actividad.update(actividad_params)
        format.html { redirect_to :controller => 'profesors', :action => 'listaact', :id => @mat_al.id, notice: 'Se agrego la calificación.' }
        #format.json { render :show, status: :ok, location: @actividad }
      else
        format.html { render :edit }
        format.json { render json: @actividad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /actividads/1
  # DELETE /actividads/1.json
  def destroy
    @actividad.destroy
    respond_to do |format|
      format.html { redirect_to current_profesor, notice: 'Se borró exitosamente la actividad.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def profesor_activo
      unless profesor_logged_in?
        redirect_to root_url
      end
    end

    def set_actividad
      @actividad = Actividad.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def actividad_params
      params.require(:actividad).permit(:nombre, :descripcion, :ponderacion, :id_parcial, :calificacion)
    end
end
