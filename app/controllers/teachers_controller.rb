class TeachersController < ApplicationController
before_filter :authenticate_admin!, :except => [:explore, :create, :email_me]
DEFAULT_PER_PAGE = 5
  def index
    if params[:q]
      @teachers = Teacher.partial_search(params[:q]).paginate(page: params[:page], per_page: (params[:per_page] || DEFAULT_PER_PAGE))
    else
      @teachers = Teacher.order('created_at DESC').paginate(page: params[:page], per_page: (params[:per_page] || DEFAULT_PER_PAGE))
    end
  end

  def new
    @teacher = Teacher.new
  end
  
  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.role_id.present? && @teacher.certificate_status.present?
      @teacher = Teacher.new(teacher_params)
      @role    = Role.find(@teacher.role_id)
      @needed_certs = Role.find(@teacher.role_id).credentials.all
      render :report
    else
      unless @teacher.role_id.present?
        @teacher.errors.add(:role_id, "must not be blank.")
      end
      unless @teacher.certificate_status.present?
        @teacher.errors.add(:certificate_status, "must not be blank.")
      end
      load_unique_roles
      render :new
    end
  end


  def email_me
    @teacher = Teacher.new(teacher_params)
    @credentials = @teacher.credentials

    if @credentials.length > 0 && verify_recaptcha(model: @teacher) && @teacher.save
      foo = TeacherMailer.send_info(@teacher.email, @teacher).deliver_now
      redirect_to "/", notice: "email sent!"
    else
      @role    = Role.find(@teacher.role_id)
      @needed_certs = Role.find(@teacher.role_id).credentials.all
      @id_list =  params[:teacher][:credential_ids]
      render :report
    end
  end


  def register_entry
    @teacher = Teacher.new(teacher_params)
    TeacherMailer.welcome_email(@teacher).deliver_later
  end
  
  def explore
    load_unique_roles
    @teacher = Teacher.new
    render :new
  end
  
  private
    def load_unique_roles
      @unique_roles = Role.find_unique_names.sort_by{|r| r.name}
    end

    def teacher_params
      params.require(:teacher).permit(:role_id, :page, :per_page, :q, :name, :email, :certificate_status,
        :credential_ids => [])
    end
end
