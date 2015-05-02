class MateriaAlumno < ActiveRecord::Base
  belongs_to :curso
  belongs_to :alumno

  validates :materia_id, presence: true, numericality: {only_integer: true, message: "Codigo erroneo de materia"}, uniqueness: {scope: [:alumno_id, :fecha], message: "Este alumno ya esta inscrito en este periodo"}
  validates :alumno_id, presence: true, numericality: {only_integer: true, message: "Codigo erroneo de alumno"}
end
