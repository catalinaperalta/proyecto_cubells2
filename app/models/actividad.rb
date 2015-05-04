class Actividad < ActiveRecord::Base
	belongs_to :parcial
	validates :nombre, presence: true, length: {maximum: 50}
	validates :descripcion, length: {maximum: 50}
	VALID_NUMBER_REGER = /(^\d*\.?\d*[0-9]+\d*$)|(^[0-9]+\d*\.\d*$)/
	validates :calificacion, presence: false , numericality: {only_integer:true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100, message: "Solo numeros enteros superiores a 0 y menores a 101"}
	validates :ponderacion, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 10, only_integer: true, message: "Solo numeros enteros superiores a 0 y menores a 11"}, format: {with: VALID_NUMBER_REGER }
	
end
