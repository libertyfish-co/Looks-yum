class TopController < ApplicationController
  def index
    @search = Food.ransack params[:q]
    if session[:user_id]
      @user_name = User.find_by(id: session[:user_id])
    end
  end
end
