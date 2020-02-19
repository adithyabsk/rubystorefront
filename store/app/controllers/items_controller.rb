class ItemsController < ApplicationController
	def index
		@items = Item.all
	end

	def show
          @item = Item.find(params[:id])
	end

	def new
		if current_user
			OtpMailer.with(user: current_user).otp_email.deliver_now
		end
		@item = Item.new
	end

	def create
		if current_user and current_user.authenticate_otp(params[:items][:otp]) == false
			self.errors[:base] << "OTP is incorrect"
			render 'new'
		end
		@item = Item.new(item_params)
		if @item.save
			redirect_to items_path
		else
			render 'new'
		end
	end

	private

	def item_params
		params.require(:item).permit(:name, :cost)
	end
end
