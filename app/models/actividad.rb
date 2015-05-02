class Actividad < ActiveRecord::Base
	belongs_to :parcial
	validates :nombre, presence: true, length: {maximum: 50}
	validates :descripcion, length: {maximum: 50}
	validates :calificacion, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 100, only_integer: true, message: "Solo numeros enteros superiores a 0 y menores a 101"}
	validates :ponderacion, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 10, only_integer: true, message: "Solo numeros enteros superiores a 0 y menores a 11"}

end
