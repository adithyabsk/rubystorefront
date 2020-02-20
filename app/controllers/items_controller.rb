class ItemsController < ApplicationController
	def index
		@items = Item.order(params[:sort])
		session[:cart] ||= [] unless session.include?(:cart)
	end

	def show
          @item = Item.find(params[:id])
	end
	
	def add
		@item = Item.find(params[:id])
		session[:cart] << @item.id
		redirect_to items_path
	end
	
	def purchase
		@item = Item.find(params[:id])
		@Total = @item.cost
		@FoodTax = 0
		@AlcTax = 0
		@ComTax = 0
		##if Category.find(@item.category_id).taxSlab == 'Food - 2%'
		##	@FoodTax = @item.cost.to_f * 0.02
		##end
		##if Category.find(@item.category_id).taxSlab == 'Alcohol - 10%'
		##	@AlcTax = @item.cost.to_f * 0.1
		##end
		##if Category.find(@item.category_id).taxSlab == 'Commodity - 7%'
		##	@ComTax = @item.cost.to_f * 0.07
		##end
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
