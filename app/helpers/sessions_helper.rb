module SessionsHelper
	def log_in(user, type)
		session[:user_id] = user.id
		session[:tipo] = type
	end

	

	def current_profesor
		if (session[:tipo] == 1)
			@current_profesor ||= Profesor.find_by(id: session[:user_id])
		else
			@current_profesor = nil
		end
	end

	def current_director
		if (session[:tipo] == 0)
			@current_director ||= Director.find_by(id: session[:user_id])
		else
			@current_director = nil
		end
	end

	def current_alumno
		if (session[:tipo] == 2)
			@current_alumno ||= Alumno.find_by(id: session[:user_id])
		else
			current_alumno = nil
		end
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

	def log_out
		session.delete(:user_id, :tipo)
		@current_director = nil
		@current_alumno = nil
		@current_profesor = nil
	end
end
