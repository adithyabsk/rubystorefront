class OtpMailer < ApplicationMailer
	default from: 'csc517store@gmail.com'
	def otp_email
		@user = params[:user]
		mail(to: @user.email, subject: "Your OTP from Store")
	end
end
