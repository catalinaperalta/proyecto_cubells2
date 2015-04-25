class Carrera < ActiveRecord::Base
	has_many :alumnos
	belongs_to :director
	has_many :materia_carreras
	has_many :materium through :materia_carreras
end
