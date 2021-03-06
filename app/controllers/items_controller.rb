# frozen_string_literal: true

class ItemsController < ApplicationController
  def index
    # All of the sorting and filters makes this complicated
    if current_user&.admin?
      @items = Item.order(params[:sort]).select do |item|
        (params[:category].nil? || Category.find_by_id(item.category_id).name == params[:category].tr('+', ' ') || params[:category] == 'All') &&
          (params[:brand].nil? || item.brand == params[:brand].tr('+', ' ') || params[:brand] == 'All') &&
          (params[:available].nil? || params[:available] == 'All' || (params[:available] == 'Available' && item.inventory > 0) || (params[:available] == 'Unavailable' && item.inventory == 0))
      end .reverse
    else
      @items = Item.order(params[:sort]).select do |item|
        item.disabled == false && (params[:category].nil? || Category.find_by_id(item.category_id).name == params[:category].tr('+', ' ') || params[:category] == 'All') &&
          (params[:brand].nil? || item.brand == params[:brand].tr('+', ' ') || params[:brand] == 'All') &&
          (params[:available].nil? || params[:available] == 'All' || (params[:available] == 'Available' && item.inventory > 0) || (params[:available] == 'Unavailable' && item.inventory == 0))
      end .reverse
    end
    session[:cart] ||= [] unless session.include?(:cart)
  end

  def show
    @item = Item.find(params[:id])
  end

  def purchase
    @item = Item.find(params[:id])
  end

  def new
    redirect_nonadmin(root_url)
    # #if current_user
    ##  OtpMailer.with(user: current_user).otp_email.deliver_now
    # #end
    @item = Item.new
  end

  def create
    redirect_nonadmin(root_url)
    # if current_user and current_user.authenticate_otp(params[:items][:otp]) == false
    #  self.errors[:base] << "OTP is incorrect"
    #  render 'new'
    # end
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path
    else
      render 'new'
    end
  end

  # GET /recipes/1/edit
  def edit
    redirect_nonadmin(root_url)
    @item = Item.find(params[:id])
  end

  # PATCH/PUT /recipes/1
  # PATCH/PUT /recipes/1.json
  def update
    redirect_nonadmin(root_url)
    @item = Item.find(params[:id])
    orig_inventory = @item.inventory
    if @item.update(item_params)
      if orig_inventory <= 0 && @item.inventory > 0 && !@item.disabled
        @item.subscriber_list.users.each do |user|
          UserMailer.with(user: user, item: @item).subscribe_email.deliver_now
        end
        @item.subscriber_list.users.clear
      end
      redirect_to @item
    else
      render 'edit'
    end
  end

  def disable
    redirect_nonadmin(items_path(params[:id]))
    @item = Item.find(params[:id])
    # disable item
    @item.disabled = true
    @item.save

    @users = User.all
    @users.each do |user|
      # Delete from wishlist
      user.wishlist.items.delete(@item)
      # Delete from cart
      if user.cart.items.include?(@item)
        user.cart.cart_items.find_by(item_id: @item).destroy
      end
    end

    redirect_to items_path
  end

  def enable
    redirect_nonadmin(params[:id])
    @item = Item.find(params[:id])
    # disable item
    @item.disabled = false
    if @item.save
      if @item.inventory > 0
        @item.subscriber_list.users.each do |user|
          UserMailer.with(user: user, item: @item).subscribe_email.deliver_now
        end
        @item.subscriber_list.users.clear
      end
    end

    redirect_to items_path
  end

  def add_item_to_wishlist
    @item = Item.find(params[:id])
    current_user.wishlist.items << @item
    current_user.wishlist.save
    current_user.save
    flash[:alert] = 'Item added to wishlist'
    redirect_to item_path(@item.id)
  end

  def add_user_to_subscriber_list
    @item = Item.find(params[:id])
    unless @item.subscriber_list.users.include? current_user
      @item.subscriber_list.users << current_user
    end
    @item.subscriber_list.save!
    flash[:alert] = "You have been added to the item's notifcation list"
    redirect_to item_path(@item.id)
  end

  private

  def item_params
    params.require(:item).permit(:name, :cost, :image_url, :brand, :restricted, :age_restricted, :inventory, :category_id)
  end
end
