# frozen_string_literal: true

# お気に入りコントローラー
class FavoritesController < ApplicationController
  before_action :find_favorite

  def create
    return if @favorite

    Favorite.create(user_id: session[:user_id], food_id: params[:id])
  end

  def destroy
    @favorite.destroy
  end

  private

  def find_favorite
    @favorite = Favorite.find_by(user_id: session[:user_id],
                                 food_id: params[:id])
  end
end
