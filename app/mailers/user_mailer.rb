class UserMailer < ActionMailer::Base
  default from: "from@otg.com"

  def trip_mailer(trip, user)
  	@trip = trip
  	@user = user
  	mail(to: @user.email, subject: 'Your Trip Info')
  end
end
