class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments


after_create :send_email_to_subscribers

private

 def send_email_to_subscribers
  Subscriber.all.each do |subscriber|
   SubscriptionMailer.send_email(subscriber.email,self)
  end
 end
 
end
