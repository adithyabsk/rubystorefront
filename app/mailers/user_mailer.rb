class UserMailer < ApplicationMailer
  default from: 'csc517store@gmail.com'

  def subscribe_email
    @user = params[:user]
    @item = params[:item]
    mail(to: @user.email, subject: "#{@item.name} Now Available")
  end
      
  
 # def subscribe_email(user, item)
   # @user = user
   # @item = item
   # mail(to: @user.email, subject: "#{@item.name} Now Available")
  #end

  def otp_email
    @user = params[:user]
    mail(to: @user.email, subject: "Your OTP from the CSC517 Store")
  end

  def purchase_email
    @cart_items = params[:cart_items]
    @user = params[:user]
    # make purchased items available as an instance variable
    mail(to: @user.email, subject: "Your Recent Purchase")
  end

  def approval_email
    @user = params[:user]
    mail(to: @user.email, subject: "Your Purchase Has Been Approved")
  end
end
