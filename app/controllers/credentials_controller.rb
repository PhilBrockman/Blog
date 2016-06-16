class CredentialsController < ApplicationController
  before_filter :authenticate_admin!
  before_action :set_credential, :except => [:create, :new, :index, :email_me]
  
  def index
    @credentials = Credential.all
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
    redirect_to credential_path(@credential)    
  end



  def email_me
    @credentials = Credential.find(credential_params[:credential_ids])

    if TeacherMailer.send_info('phil.brockman@gmail.com', @credentials).deliver_later
      #format.html { redirect_to root_url, notice: 'Credentials were successfully sent!'}
      redirect_to root_url
    else
      format.html {redirect_to '/', alert: 'BOOOOO'}
    end
  end
 
  private

    def set_credential
      @credential = Credential.find(params[:id])
    end
  
    def credential_params
      params.require(:credential).permit(:name, :note, :link, :credential_ids => [])
    end
end
