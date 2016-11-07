class WelcomeController < ApplicationController
	before_action :authenticate_admin!, only: [:dashboard]
	  def index
	  end
	  def dashboard
	  	@proyects = Proyect.all
	  end
end
