class CredentialsController < ApplicationController
  before_action :set_role
#  def create
 #   @credential = @role.credentials.create(credential_params)
#    
#      redirect_to role_path(@role)
 # end
  def create
    @credential = @role.credentials.new(credential_params)

    respond_to do |format|
      if @credential.save
        format.html { redirect_to @role, notice: 'Role was successfully created.' }
        format.json { render @role, status: :created, location: @role }
      else
        format.html { render :new }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def edit
    @credential = @role.credentials.find(params[:id])
  end
  
  def update
    @credential = Credential.find(params[:id])
    
    respond_to do |format|
      if @credential.update(credential_params)
        format.html { redirect_to @role, notice: 'Credential was successfully updated.' }
        format.json { render :show, status: :ok, location: @role }
        else
        format.html { render :edit }
        format.json { render json: @role.credentials.errors, status: :unprocessable_entity }
      end
      end
    
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
