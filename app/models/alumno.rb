class Alumno < ActiveRecord::Base
	belongs_to :carrera
	has_many :materia_alumnos
	has_many :materium through :materia_alumnos
end
