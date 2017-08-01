class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  enum role: [:full_access, :restricted_access]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  #scope :with_full_access, ->{ where(role: 'full_access')}
  scope :with_restricted_access_access, ->{ where(role: 'restricted_access')}

  #def self.with_full_access
   # where(role: 'full_access')
  #end



end
