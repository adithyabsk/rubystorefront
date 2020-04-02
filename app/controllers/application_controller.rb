# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by_id(session[:user_id])
    else
      @current_user = nil
    end
  end

  def invalid_session?
    session[:user_id].nil? || User.find(params[:id]).id != session[:user_id]
  end

  def redirect_nonlogged_in
    redirect_to root_path if invalid_session? || User.find(params[:id]).id != session[:user_id]
  end

  def redirect_nonadmin(redirect_path)
    redirect_to redirect_path if invalid_session? || !User.find(session[:user_id]).is_admin
  end
end
