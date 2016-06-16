class TeacherMailer < ApplicationMailer

  default from: 'Kipp@kipp.com'
 
  def welcome_email(teacher)
  	@teacher = teacher
    mail(to: "phil.brockman@gmail.com", subject: 'Welcome to My Awesome Site')
  end

  def send_info(email, teacher)
  	@teacher = teacher
  	mail(to: email, subject: 'KIPP -- Certification Information')
  end

end
