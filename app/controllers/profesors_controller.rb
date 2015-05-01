class ProfesorsController < ApplicationController
  before_action :logged_in_profesor, only: [:set_profesor, :show, :edit, :update, :destroy]
  before_action :correct_profesor, only: [:show, :edit, :update, :destroy]

  # GET /profesors
  # GET /profesors.json
  def index
    @profesors = Profesor.all
  end

  # GET /profesors/1
  # GET /profesors/1.json
  def show
    @profesor = Profesor.find(params[:id])
    @materias = Curso.select("cursos.*").where("cursos.profesor = ?", params[:id])
  end

  # GET /profesors/new
  def new
    @profesor = Profesor.new
  end

  # GET /profesors/1/edit
  def edit
  end

  # POST /profesors
  # POST /profesors.json
  def create
    @profesor = Profesor.new(profesor_params)

    respond_to do |format|
      if @profesor.save
        format.html { redirect_to @profesor, notice: 'Profesor was successfully created.' }
        format.json { render :show, status: :created, location: @profesor }
      else
        format.html { render :new }
        format.json { render json: @profesor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profesors/1
  # PATCH/PUT /profesors/1.json
  def update
    respond_to do |format|
      if @profesor.update(profesor_params)
        format.html { redirect_to @profesor, notice: 'Profesor was successfully updated.' }
        format.json { render :show, status: :ok, location: @profesor }
      else
        format.html { render :edit }
        format.json { render json: @profesor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profesors/1
  # DELETE /profesors/1.json
  def destroy
    @profesor.destroy
    respond_to do |format|
      format.html { redirect_to profesors_url, notice: 'Profesor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def logged_in_profesor
    unless profesor_logged_in?
      redirect_to root_url
    end
  end

  def correct_profesor
    @user = Profesor.find_by(id: params[:id])
    redirect_to(root_url) unless @user == current_profesor
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_profesor
      @profesor = Profesor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profesor_params
      params.require(:profesor).permit(:nomina, :nombre, :apellido, :password)
    end
end
