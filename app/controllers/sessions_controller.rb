class SessionsController < ApplicationController
  def new
  end

  def create
  	user = Director.find_by(nomina: params[:session][:usuario].downcase)
  	if user
  		if user.password == params[:session][:password]
  			log_in user
  			redirect_to user
  		end
  	else
  		user = Alumno.find_by(matricula: params[:session][:usuario].downcase)
  		if user
  			if user.password == params[:session][:password]
  				log_in user
  				redirect_to user
  			end
  		else
  			user = Profesor.find_by(nomina: params[:session][:usuario].downcase)
  			if user
  				if user.password == params[:session][:password]
  					log_in user
  					redirect_to user
  				end
  			end
  		end
  	render 'new'
  	end
  end

  def destroy
  end
end
