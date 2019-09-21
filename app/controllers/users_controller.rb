# frozen_string_literal: true

# ユーザーコントローラー
class UsersController < ApplicationController
  def index
    user = User.find_by(id: session[:user_id])
    @favorites = user.foods
  end

  def auth_done
    user_name = 'Test'

    # find_or_create_byメソッドが使える
    user = User.find_by(name: user_name) || User.create(name: user_name)
    user.save
    session[:user_id] = user.id

    redirect_to :root
  end
end
