class Profesor < ActiveRecord::Base
	has_many :materia_profesors
	has_many :materium through :materia_profesors
end
