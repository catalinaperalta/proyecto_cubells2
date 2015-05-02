class Actividad < ActiveRecord::Base
	belongs_to :parcial
	validates :nombre, presence: true, length: {maximum: 50}
	validates :descripcion, length: {maximum: 50}
	validates :calificacion, numericality: { only_integer: true, message: "Solo numeros enteros"}
end
