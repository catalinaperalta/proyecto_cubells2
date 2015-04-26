class Carrera < ActiveRecord::Base
	has_many :alumnos
	belongs_to :director
	has_many :materia_carreras
	has_many :cursos, :through => :materia_carreras
end
