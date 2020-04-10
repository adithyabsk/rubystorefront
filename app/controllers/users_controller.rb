# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    redirect_nonadmin(root_url)
    @users = User.all
  end

  def show
    redirect_nonadmin(root_url)
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    redirect_nonadmin(root_url)
    @user = User.find(params[:id])
  end

  def create
    redirect_nonadmin(root_url)
    params.delete(:password) if params[:password].blank?
    @user = User.new(user_params)

    if @user.save
      if current_user&.admin?
        redirect_to users_path
      else
        redirect_to sessions_new_path
      end
    else
      render 'new'
    end
  end

  def update
    redirect_nonadmin(root_url)
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    redirect_nonadmin(root_url)
    @user = User.find(params[:id])
    @user.ledger_entries.each do |le|
      le.user = nil
      le.save!
    end
    @user.subscriber_lists.clear
    @user.destroy
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin?, :phone_num, :dob, :address_l1, :address_l2, :city, :state, :zip, :card_name, :card_num, :card_expire, :card_ccv)
  end
end
