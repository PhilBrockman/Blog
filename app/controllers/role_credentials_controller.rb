class RoleCredentialsController < ApplicationController
	before_filter :authenticate_admin!
	def index
	end

	def new
		@role_credential = RoleCredential.new
	end

	def create
		@role_credential = RoleCredential.new(role_credential_params)

	    respond_to do |format|
	      if @role_credential.save
	        format.html { redirect_to Role.find(@role_credential.role_id), notice: 'Association was successfully created.' }
	      else
	        format.html { render :new }
	      end
	  end
	end

	def destroy
		@role_credential = RoleCredential.find(params[:id])
		role = @role_credential.role
    	@role_credential.destroy
    	respond_to do |format|
      		format.html { redirect_to role, notice: 'Role was successfully destroyed.' }
  		end
	end

	private
		def role_credential_params
			params.require(:role_credential).permit(:role_id, :credential_id)
		end
end
