# frozen_string_literal: true

# Facebook認証コントローラー
class FacebookController < ApplicationController
  def auth_done
    auth = request.env['omniauth.auth']
    user_name = auth[:info][:name]

    # find_or_create_byメソッドが使える
    user = User.find_by(name: user_name) || User.create(name: user_name)
    user.save
    session[:user_id] = user.id

    redirect_to :root
  end
end
