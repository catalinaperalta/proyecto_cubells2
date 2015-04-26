class Profesor < ActiveRecord::Base
	has_many :materia_profesors
	has_many :cursos, :through => :materia_profesors
end
