class Backoffice::DashboardController < ApplicationController
  before_action :authenticate_admin! #autenticar qual papel pode acessar.
  
  layout "backoffice"

  def index
  end
end
