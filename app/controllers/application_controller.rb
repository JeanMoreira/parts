class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

   layout :layout_by_resource
  # Layout per resource_name
	protected 
	def layout_by_resource
	  if devise_controller? && resource_name == :admin
	    "backoffice_devise"
	  else
	    "application"
	  end
	end

end
