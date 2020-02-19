class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phoneNumber, :dateOfBirth, :addressL1, :addressL2, :addressL3, :cardName, :cardNum, :cardExpire, :cardCCV, :isAdmin])
	end
end
