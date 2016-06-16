class TeachersController < ApplicationController

  def index
    @teachers = Teacher.all
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
    @teacher.save

    foo = TeacherMailer.send_info('phil.brockman+now@gmail.com', @credentials).deliver_now
    redirect_to root_url, notice: "email sent!"
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
      params.require(:teacher).permit(:role_id, :grade_level, :special_education, 
        :certificate_location,:certificate_status, :name,
        :credential_ids => [])
    end
end
