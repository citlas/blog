class SubscriptionMailer < ApplicationMailer
default from: "citlalli.prado@gmail.com"
def send_email(email,post)    
  @post = post
  mail(to: email, subject: @post.title)
end
end
