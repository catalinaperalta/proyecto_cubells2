class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  def direccion_mala
  	redirect_to '/'
  end

  protect_from_forgery with: :exception
  include SessionsHelper
  include ProfesorsHelper
  include MateriaAlumnosHelper
  include ActividadsHelper
end
