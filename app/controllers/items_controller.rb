class ItemsController < ApplicationController
	def index
		@items = Item.order(params[:sort])
	end

	def show
          @item = Item.find(params[:id])
	end

	def new
		##if current_user
		##	OtpMailer.with(user: current_user).otp_email.deliver_now
		##end
		@item = Item.new
	end

	def create
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
		@item = Item.find(params[:id])
    end
	
	# PATCH/PUT /recipes/1
    # PATCH/PUT /recipes/1.json
	def update
	  @user = Item.find(params[:id])
	  if @item.update(item_params)
		  redirect_to @item
	  else
	    render 'edit'
	  end

  end

  def destroy
	  @item = Item.find(params[:id])
	  @item.destroy
	  redirect_to items_path
  end

	private

	def item_params
		params.require(:item).permit(:name, :cost, :imageURL, :brand, :restricted, :ageRestricted, :quantity, :category_id)
	end
end
