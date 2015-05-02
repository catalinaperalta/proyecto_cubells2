module ProfesorsHelper

	def definir_materia (idma)
		@materia_seleccionada = Curso.find(idma)
	end

end
