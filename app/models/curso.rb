class Curso < ActiveRecord::Base
	has_many :materia_alumnos
	has_many :alumnos, :through => :materia_alumnos
	has_many :materia_profesors
	has_many :profesors, :through => :materia_profesors
	has_many :materia_carreras
	has_many :carreras, :through => :materia_carreras
end
