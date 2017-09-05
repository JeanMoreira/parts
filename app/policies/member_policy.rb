class MemberPolicy < ApplicationPolicy

	def new?
		
	end	

	def edit?
		
	end 

	def destroy?
		
	end 


	def permitted_attributes
		[:email,:name, :password, :password_confirmation]
	end

	class Scope < Scope
		def resolve
			scope.all
			
		end
	end
end
