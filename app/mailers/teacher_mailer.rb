class TeacherMailer < ApplicationMailer

  default from: 'test@example.com'
 
  def welcome_email(teacher)
  	@teacher = teacher
    mail(to: "phil.brockman@gmail.com", subject: 'Welcome to My Awesome Site')
  end

  def send_info(email, credentials)
  	@credentials = credentials
  	mail(to: email, subject: 'KIPP -- Certification Information')
  end

  def send_simple_message
	  RestClient.post "https://api:key-0221af758d6c4ae43d2e51410209726d"\
	  "@api.mailgun.net/v3/sandbox5e68034d231a411081fcc172d138aecc.mailgun.org/messages",
	  :from => "Excited User <mailgun@sandbox5e68034d231a411081fcc172d138aecc.mailgun.org>",
	  :to => "phil.brockman@gmail.com",
	  :subject => "Hello",
	  :text => "Testing some Mailgun awesomness!"
	end

end
