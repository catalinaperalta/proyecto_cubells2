class Parcial < ActiveRecord::Base
	has_many :actividads
	belongs_to :materia_alumno
end
