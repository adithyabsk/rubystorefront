class SubscribeMailer < ApplicationMailer
	default from: 'csc517store@gmail.com'
	def subscribe_email
		@user = current_user
		mail(to: @user.email, subject: "Item Now Available")
	end
end
