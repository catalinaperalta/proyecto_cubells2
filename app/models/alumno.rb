class Alumno < ActiveRecord::Base
	belongs_to :carrera
	has_many :materia_alumnos
	has_many :cursos, :through => :materia_alumnos

	validates :matricula, presence: true, length: {minimum: 9, maximum: 9}, uniqueness: true
	validates :nombre, presence: true, length: {maximum: 50}
	validates :apellido_p, presence: true, length: {maximum: 50}
	validates :apellido_m, presence: true, length: {maximum: 50}
	validates :password, presence: true, length: {minimum: 5, maximum:25}

end
