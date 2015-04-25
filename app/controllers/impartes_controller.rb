class ImpartesController < ApplicationController
  before_action :set_imparte, only: [:show, :edit, :update, :destroy]

  # GET /impartes
  # GET /impartes.json
  def index
    @impartes = Imparte.all
  end

  # GET /impartes/1
  # GET /impartes/1.json
  def show
  end

  # GET /impartes/new
  def new
    @imparte = Imparte.new
  end

  # GET /impartes/1/edit
  def edit
  end

  # POST /impartes
  # POST /impartes.json
  def create
    @imparte = Imparte.new(imparte_params)

    respond_to do |format|
      if @imparte.save
        format.html { redirect_to @imparte, notice: 'Imparte was successfully created.' }
        format.json { render :show, status: :created, location: @imparte }
      else
        format.html { render :new }
        format.json { render json: @imparte.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /impartes/1
  # PATCH/PUT /impartes/1.json
  def update
    respond_to do |format|
      if @imparte.update(imparte_params)
        format.html { redirect_to @imparte, notice: 'Imparte was successfully updated.' }
        format.json { render :show, status: :ok, location: @imparte }
      else
        format.html { render :edit }
        format.json { render json: @imparte.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /impartes/1
  # DELETE /impartes/1.json
  def destroy
    @imparte.destroy
    respond_to do |format|
      format.html { redirect_to impartes_url, notice: 'Imparte was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_imparte
      @imparte = Imparte.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def imparte_params
      params.require(:imparte).permit(:codma, :nomina)
    end
end
