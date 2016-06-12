class TeachersController < ApplicationController
  def new
    @teacher = Teacher.new
  end
  
  def create
    @teacher = Teacher.new(teacher_params)
    @role    = Role.find(@teacher.role_id)
    
    if @teacher.special_education
      @special_education = true
    end
      if @teacher.PA #has local certs
        @pa_certified = true
      if @teacher.US #has certs in another state
        @out_of_state = true
      end
    else #no certs
      @needed_certs = Role.find(@teacher.role_id).credentials.all
    end
    
    render :report
  end
  
  def explore
    @teacher = Teacher.new
    @unique_roles = Role.find_unique_names
    render :new
  end
  
  private
    def teacher_params
      params.require(:teacher).permit(:role_id, :grade_level, :special_education, :PA, :US, :name)
    end
end
