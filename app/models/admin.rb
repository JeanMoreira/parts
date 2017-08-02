class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
   # Constants
  ROLES = {:full_access => 0, :restricted_access => 1}

  # Enums
  enum role: ROLES


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # defini o acesso ao privelegio completo
   # Scopes
  scope :with_full_access, -> { where(role: ROLES[:full_access]) }
  scope :with_restricted_access, -> { where(role: ROLES[:restricted_access]) }

end
