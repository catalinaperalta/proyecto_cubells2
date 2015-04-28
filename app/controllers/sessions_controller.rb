class SessionsController < ApplicationController
  def new
  end

  def create
  	user = Director.find_by()
  	render 'new'
  end

  def destroy
  end
end
