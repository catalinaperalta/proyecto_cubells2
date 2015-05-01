module SessionsHelper
	def log_in(user)
		session[:user_id] = user.id
	end

	def log_out
		session.delete(:user_id)
	end

	def current_profesor
		@current_profesor ||= Profesor.find_by(id: session[user_id])
	end

	def current_director
		@current_director ||= Direcor.find_by(id: session[user_id])
	end

	def current_alumno
		@current_alumno ||= Alumnos.find_by(id: session[user_id])
	end

	def alumno_logged_in?
		!current_alumno.nil?
	end

	def profesor_logged_in?
		!current_profesor.nil?
	end

	def director_logged_in?
		!current_director.nil?
	end

end
