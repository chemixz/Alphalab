class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  before_action :set_categories
  before_action :set_asides_articles
  before_action :set_asides_responsibles
protected

	def authenticate_editor!
		redirect_to root_path unless user_signed_in? && current_user.is_editor?
	end

	def authenticate_admin!
		redirect_to root_path unless user_signed_in? && current_user.is_admin?
	end

private
	  def set_categories
	  	@categories = Category.all
	  end
	  def set_asides_articles
	  	@proyectaside = Proyect.asideultimos
	  end
	  def set_asides_responsibles
	  	@responsibles = Responsible.all
	  end
	 
end
