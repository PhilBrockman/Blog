class TeacherMailer < ApplicationMailer

  default from: 'the_team@kipp.com'
 
  def welcome_email(teacher)
  	@teacher = teacher
    mail(to: "phil.brockman@gmail.com", subject: 'Welcome to My Awesome Site')
  end
end
