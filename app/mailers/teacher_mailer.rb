class TeacherMailer < ApplicationMailer

  default from: 'Kipp@kipp.com'

  def send_info(email, teacher)
  	@teacher = teacher
  	@role = Role.find(@teacher.role_id)
  	mail(to: email, subject: 'KIPP -- Certification Information')
  end

end
