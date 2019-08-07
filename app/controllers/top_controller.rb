# frozen_string_literal: true

# トップページコントローラー
class TopController < ApplicationController
  def index
    @search = Food.ransack params[:q]
    @user_name = User.find_by(id: session[:user_id]) if session[:user_id]
  end
end
