class FavoritesController < ApplicationController
  def create
    unless find_favorite
      Favorite.create(user_id: session[:user_id], food_id: params[:id])
    end
  end

  def destroy
    favorite = Favorite.find_by(user_id: session[:user_id], food_id: params[:id])
    favorite.destroy
  end

  private

  def find_favorite
    @find_favorite = Favorite.find_by(user_id: session[:user_id], food_id: params[:id])
  end
end
