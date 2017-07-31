class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  enum role: [:full_acess, :restricted_access]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  def role_br
  	if self.role ==['full_acess']
  		"Acesso completo"
  	else
  		"Acesso restrito"	
  	end
  	
  end

end
