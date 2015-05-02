class Actividad < ActiveRecord::Base
	belongs_to :parcial
	validates :nombre, presence: true, length: {maximum: 50}
	validates :descripcion, length: {maximum: 50}
	validates :calificacion, numericality: {greater_than_or_equal_to: 0, only_integer: true, message: "Solo numeros enteros superiores a 0"}
end
