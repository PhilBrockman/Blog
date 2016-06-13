class TeachersController < ApplicationController
  def new
    @teacher = Teacher.new
  end
  
  def create
    @teacher = Teacher.new(teacher_params)
    @role    = Role.find(@teacher.role_id)
    @needed_certs = Role.find(@teacher.role_id).credentials.all
      
    render :report
  end
  
  def explore
    @teacher = Teacher.new
    @unique_roles = Role.find_unique_names.sort_by{|r| r.name}
    render :new
  end
  
  private
    def teacher_params
      params.require(:teacher).permit(:role_id, :grade_level, :special_education, :certificate_location,:certificate_status, :name)
    end
end
