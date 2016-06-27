class TeachersController < ApplicationController
before_filter :authenticate_admin!, :except => [:explore, :create, :email_me]
  def index
    @teachers = Teacher.all.reverse
  end

  def new
    @teacher = Teacher.new
  end
  
  def create
    @teacher = Teacher.new(teacher_params)
    @role    = Role.find(@teacher.role_id)
    @needed_certs = Role.find(@teacher.role_id).credentials.all
    #puts "\n\n\n......\n\n\n"
    #TeacherMailer.welcome_email(@teacher).deliver_now
    render :report
  end


  def email_me
    @teacher = Teacher.new(teacher_params)
    @credentials = @teacher.credentials
    if verify_recaptcha(model: @teacher) && @teacher.save
      foo = TeacherMailer.send_info(@teacher.email, @teacher).deliver_now
      redirect_to "/", notice: "email sent!"
    else
      @role    = Role.find(@teacher.role_id)
      @needed_certs = Role.find(@teacher.role_id).credentials.all
      render :report
    end
  end


  def register_entry
    @teacher = Teacher.new(teacher_params)
    TeacherMailer.welcome_email(@teacher).deliver_later
  end
  
  def explore
    @teacher = Teacher.new
    @unique_roles = Role.find_unique_names.sort_by{|r| r.name}
    render :new
  end
  
  private
    def teacher_params
      params.require(:teacher).permit(:role_id, :name, :email,
        :credential_ids => [])
    end
end
