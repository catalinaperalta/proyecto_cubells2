class SessionsController < ApplicationController
  def new
  end

  def create
  	user = Director.find_by(nomina: params[:session][:usuario])
  	if user
  		if user.password == params[:session][:password]
  			log_in user, 0
        session
  			redirect_to user and return
      else
          flash[:danger] = 'Invalid password'
          render 'new'
      
  		end
  	else
  		user = Alumno.find_by(matricula: params[:session][:usuario])
  		if user
  			flash[:success] = 'Valid alumno'
  			if user.password == params[:session][:password]
  				log_in user, 2

  				redirect_to user and return
  			else
  				flash[:danger] = 'Invalid password'
  			end
  		else
  			user = Profesor.find_by(nomina: params[:session][:usuario])
  			if user
  				if user.password == params[:session][:password]
  					log_in user, 1
  					redirect_to user and return
  				end
  			end
  		end

  	render 'new'
  	end
  end

  def destroy
    log_out if (profesor_logged_in? || alumno_logged_in? || director_logged_in?)
    redirect_to root_url
  end
end
