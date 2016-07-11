class CredentialsController < ApplicationController
  before_filter :authenticate_admin!
  before_action :set_credential, :except => [:create, :new, :index, :email_me]
  
  def index
    @exams = Credential.where(:exam => true).order('name ASC')
    @creds = Credential.all - @exams
  end

  def new
    @credential = Credential.new
  end

  def show

  end

  def create
    @credential = Credential.new(credential_params)

    respond_to do |format|
      if @credential.save
        format.html { redirect_to @credential, notice: 'Credential was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end
  
  def edit
  end
  
  def update
    respond_to do |format|
      if @credential.update(credential_params)
        format.html { redirect_to @credential, notice: 'Credential was successfully updated.' }
        format.json { render :show, status: :ok, location: @credential }
        else
        format.html { render :edit }
      end
    end
  end
  
  def destroy
    @credential.destroy
    redirect_to credentials_path   
  end

 
  private

    def set_credential
      @credential = Credential.find(params[:id])
    end
  
    def credential_params
      params.require(:credential).permit(:name, :note, :link, :exam, :credential_ids => [])
    end
end
