class UsersController < ApplicationController
	
  def index
    @users = User.all
  end

  def show
    @user =User.find(params[:id])
  end

  def new
	  @user = User.new
  end

  def edit
	  @user = User.find(params[:id])
  end

  def create
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
      Wishlist.create(user_id:@user.id)
      redirect_to sessions_new_path
    else
      render 'new'
    end  
  end

  def update
	  @user = User.find(params[:id])
	  if @user.update(user_params)
		  redirect_to @user
	  else
	    render 'edit'
	  end

  end

  def destroy
	  @user = User.find(params[:id])
	  @user.destroy
	  redirect_to users_path
  end

  private

  def user_params
	  params.require(:user).permit(:name, :email, :password, :password_confirmation, :is_admin, :phone_num, :dob, :address_l1, :address_l2, :city, :state, :zip, :card_name, :card_num, :card_expire, :card_ccv)
  end
end
