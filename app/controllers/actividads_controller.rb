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

  # GET /actividads/new
  def new
    @actividad = Actividad.new
  end

  # GET /actividads/1/edit
  def edit
  end

  # POST /actividads
  # POST /actividads.json
  def create
    @actividad = Actividad.new(actividad_params)

    respond_to do |format|
      if @actividad.save
        format.html { redirect_to @actividad, notice: 'Se genero la actividad.' }
        format.json { render :show, status: :created, location: @actividad }
      else
        format.html { render :new }
        format.json { render json: @actividad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /actividads/1
  # PATCH/PUT /actividads/1.json
  def update
    # @ma = MateriaAlumno.select("materia_alumnos.*").joins("JOIN parcial ON parcials.id_materia_alumno = materia_alumnos.id JOIN actividads ON actividads.id_parcial = parcials.id").where("actividads.id = ?", params[:id])
    @mat_al = MateriaAlumno.select("materia_alumnos.id").joins("JOIN parcials ON parcials.id_materia_alumno = materia_alumnos.id JOIN actividads ON actividads.id_parcial = parcials.id").where("actividads.id = ?", params[:id])
    @id = @mat_al.id
    respond_to do |format|
      if @actividad.update(actividad_params)
        format.html { redirect_to :controller => 'profesors', :action => 'listaact', :id => @id, notice: 'Se agrego la calificación.' }
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
      format.html { redirect_to actividads_url, notice: 'Se borró exitosamente la actividad.' }
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
