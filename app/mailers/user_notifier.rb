class UserNotifier < ActionMailer::Base
  default :from => 'npisciotta@gmail.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_signup_email(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'Thanks for signing up for Desk Nomad!' )
  end

  def send_booking_email(user, cart)
    @user = user
    @property = Property.find(cart.contents.keys.join)
    mail( :to => @user.email,
    :subject => "Thanks for booking #{@property.title} on Desk Nomad!" )
  end

end
