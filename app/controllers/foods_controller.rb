# frozen_string_literal: true

# 食材コントローラー
class FoodsController < ApplicationController
  def index
    @search = Food.ransack params[:q]
    @result = @search.result

    redirect_to root_path if @result.blank?
    return unless session[:user_id]

    @users_favorite = Favorite.where(user_id: session[:user_id])
  end

  def new
    @food = Food.new
    @point = Point.all
  end

  def create # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
    @food = Food.new(food_params)
    unless @food.valid?
      @point = Point.all
      @food.errors.add(:point, 'Point select please.') if params[:point].blank?
      render(:new) && return
    end

    submit_point_id = []
    params[:point].map { |id| submit_point_id << id[:id].to_i }
    if @food.save
      # pointテーブルへ登録
      submit_point_id.each do |point_id|
        FoodPoint.create(food_id: @food.id, point_id: point_id)
      end
      flash[:notice] = "#{@food.name}を登録しました"
      redirect_to foods_path
    else
      redirect_to new_food_path
    end
  end

  private

  def food_params
    params.require(:food).permit(:name, :description, :image)
  end
end
