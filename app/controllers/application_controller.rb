class ApplicationController < ActionController::Base
   
	#pundit
   include Pundit

   #manage pundit errros

   rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized


   protect_from_forgery with: :exception

   layout :layout_by_resource
  # Layout per resource_name
	protected 

	def user_not_authorized
	    flash[:alert] = "Você não esta autorizado a executar essa navegação."
	    redirect_to(request.referrer || root_path)
  end

	def layout_by_resource
	  if devise_controller? && resource_name == :admin
	    "backoffice_devise"
	  else
	    "application"
	  end
	end

end
