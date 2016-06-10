class CredentialsController < ApplicationController
  before_action :set_role
  def create
    @credential = @role.credentials.create(credential_params)
    
      redirect_to role_path(@role)
  end
  
  def destroy
    @credential = @role.credentials.find(params[:id])
    @credential.destroy
    redirect_to role_path(@role)    
  end
 
  private
    def set_role
      @role = Role.find(params[:role_id])    
    end
  
    def credential_params
      params.require(:credential).permit(:name, :required)
    end
end
