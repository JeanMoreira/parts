class BackofficeController < ApplicationController
  before_action :authenticate_admin! #autenticar qual papel pode acessar.
  layout "backoffice"
end
