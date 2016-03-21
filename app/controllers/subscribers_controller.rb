class SubscribersController < ApplicationController
 def create
    @subscriber = Subscriber.new(params[:email])
    @subscriber.save
    redirect_to root_path
    
  end
end
