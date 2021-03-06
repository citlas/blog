class UserMailer < ApplicationMailer
	 default from: "citlalli.prado@gmail.com"

  def contact_form(email, name, message)
  @message = message
    mail(:from => email,
        :to => 'citlalli.prado@gmail.com',
        :subject => "A new contact form message from #{name}")
  end

def welcome(user)
  @appname = "Citlas blog"
  mail( :to => user.email,
        :subject => "Welcome to #{@appname}!")
end

end
