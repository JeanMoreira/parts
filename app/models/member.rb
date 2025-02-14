class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  has_many :phones
  has_many :addresses
  

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
