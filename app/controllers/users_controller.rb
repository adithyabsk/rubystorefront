class UsersController < ApplicationController
	
  def index
	if session[:user_id] == nil || User.find(session[:user_id]).is_admin? == false
		redirect_to root_url
	end
    @users = User.all
  end

  def show
	if session[:user_id] == nil || (User.find(session[:user_id]).is_admin? == false && User.find(params[:id]).id != session[:user_id])
		redirect_to root_url
	end
    @user =User.find(params[:id])
  end

  def new
	if session[:user_id] == nil || User.find(session[:user_id]).is_admin? == false
		redirect_to root_url
	end
	  @user = User.new
  end

  def edit
	if session[:user_id] == nil || (User.find(session[:user_id]).is_admin? == false && User.find(params[:id]).id != session[:user_id])
		redirect_to root_url
	end
	  @user = User.find(params[:id])
  end

  def create
	if session[:user_id] == nil || User.find(session[:user_id]).is_admin? == false
		redirect_to root_url
	end
    #if params[:user][:password] == ""
    #	    params[:user][:password] = "badpassword"
    #end
    if params[:password].blank?
	    params.delete(:password)
    end
    @user = User.new(user_params)
    if not @user.cart.present?
      @user.cart = Cart.create
    end

    if @user.save
      redirect_to sessions_new_path
    else
      render 'new'
    end  
  end

  def update
	if session[:user_id] == nil || (User.find(session[:user_id]).is_admin? == false && User.find(params[:id]).id != session[:user_id])
		redirect_to root_url
	end
	  @user = User.find(params[:id])
	  if @user.update(user_params)
		  redirect_to @user
	  else
		render 'edit'
	  end
  end

  def destroy
	if session[:user_id] == nil || User.find(session[:user_id]).is_admin? == false
		redirect_to root_url
	end
	  @user = User.find(params[:id])
	  @user.destroy
	  redirect_to users_path
  end

  private

  def user_params
	  params.require(:user).permit(:name, :email, :password, :password_confirmation, :is_admin, :phone_num, :dob, :address_l1, :address_l2, :city, :state, :zip, :card_name, :card_num, :card_expire, :card_ccv)
  end
end
