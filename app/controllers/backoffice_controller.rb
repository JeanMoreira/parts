class BackofficeController < ApplicationController
  before_action :authenticate_admin! #autenticar qual papel pode acessar.
  layout "backoffice"

  def pundit_user
  	current_admin # current_user to pundit
  end
end
