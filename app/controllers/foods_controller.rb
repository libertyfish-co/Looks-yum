# frozen_string_literal: true

# 食材コントローラー
class FoodsController < ApplicationController
  before_action -> { @points = Point.all }, only: %i[new create]

  def index
    @search = Food.ransack params[:q]
    @result = @search.result

    redirect_to root_path if @result.blank?
    return unless session[:user_id]

    @users_favorite = Favorite.where(user_id: session[:user_id])
  end

  def new
    @food = Food.new
  end

  def create
    point_ids = (params[:point] || []).map { |point| point[:id] }
    @food = Food.build(food_params, point_ids)
    unless @food.valid?
      @food.errors.add(:point, 'select please.') if params[:point].blank?
      render(:new) && return
    end

    if @food.save
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
