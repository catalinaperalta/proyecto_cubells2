class Alumno < ActiveRecord::Base
	belongs_to :carrera
	has_many :materia_alumnos
	has_many :cursos, :through => :materia_alumnos
end
