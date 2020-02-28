class ItemsController < ApplicationController
	def index
	#All of the sorting and filters makes this complecated
	if current_user && current_user.is_admin == true
		@items = Item.order(params[:sort]).select { |i| (params[:category] == nil || Category.find_by_id(i.category_id).name == params[:category].gsub("+", " ") || params[:category] == "All") &&
		(params[:brand] == nil || i.brand == params[:brand].gsub("+", " ") || params[:brand] == "All") && 
		(params[:available] == nil || params[:available] == "All" || (params[:available] == "Available" && i.inventory > 0) || (params[:available] == "Unavailable" && i.inventory == 0))} 
	else
		@items = Item.order(params[:sort]).select { |i| i.disabled == false && (params[:category] == nil || Category.find_by_id(i.category_id).name == params[:category].gsub("+", " ") || params[:category] == "All") &&
		(params[:brand] == nil || i.brand == params[:brand].gsub("+", " ") || params[:brand] == "All") && 
		(params[:available] == nil || params[:available] == "All" || (params[:available] == "Available" && i.inventory > 0) || (params[:available] == "Unavailable" && i.inventory == 0)) }
	end
		session[:cart] ||= [] unless session.include?(:cart)
	end

	def show
          @item = Item.find(params[:id])
	end
	
	def purchase
		@item = Item.find(params[:id])
		@Total = @item.cost
	end

	def new
		if session[:user_id] == nil || User.find(session[:user_id]).is_admin? == false
			redirect_to root_url
		end
		##if current_user
		##	OtpMailer.with(user: current_user).otp_email.deliver_now
		##end
		@item = Item.new
	end

	def create
		if session[:user_id] == nil || User.find(session[:user_id]).is_admin? == false
			redirect_to root_url
		end
		#if current_user and current_user.authenticate_otp(params[:items][:otp]) == false
		#	self.errors[:base] << "OTP is incorrect"
		#	render 'new'
		#end
		@item = Item.new(item_params)
		if @item.save
			redirect_to items_path
		else
			render 'new'
		end
	end
	
	# GET /recipes/1/edit
    def edit
		if session[:user_id] == nil || User.find(session[:user_id]).is_admin? == false
			redirect_to items_path(params[:id])
		end
		@item = Item.find(params[:id])
    end
	
	# PATCH/PUT /recipes/1
    # PATCH/PUT /recipes/1.json
	def update
	  if session[:user_id] == nil || User.find(session[:user_id]).is_admin? == false
			redirect_to items_path(params[:id])
		end
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
		if session[:user_id] == nil || User.find(session[:user_id]).is_admin? == false
			redirect_to items_path(params[:id])
		end
	  @item = Item.find(params[:id])
	  #disable item
	  @item.disabled = true
      @item.save
	  
	  @users = User.all
	  @users.each do |user|
		#Delete from wishlist
		user.wishlist.items.delete(@item)
		#Delete from cart
		if user.cart.items.include?(@item)
			user.cart.cart_items.find_by(item_id: @item).destroy
		end
	  end
	   
	  
	  redirect_to items_path
  end
  
  def enable
		if session[:user_id] == nil || User.find(session[:user_id]).is_admin? == false
			redirect_to items_path(params[:id])
		end
	  @item = Item.find(params[:id])
	  #disable item
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
	  	current_user.wishlist.items<<@item
		current_user.wishlist.save
		current_user.save
	  	flash[:alert] = "Item added to wishlist"
	  redirect_to item_path(@item.id)
  end

  def add_user_to_subscriber_list
    @item = Item.find(params[:id])
    @item.subscriber_list.users << current_user
    @item.subscriber_list.save
    flash[:alert] = "You have been added to the item's notifcation list"
    redirect_to item_path(@item.id)
  end
	private

	def item_params
		params.require(:item).permit(:name, :cost, :image_url, :brand, :restricted, :age_restricted, :inventory, :category_id)
	end
end
