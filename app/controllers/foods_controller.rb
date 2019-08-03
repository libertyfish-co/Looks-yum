class FoodsController < ApplicationController
  def index
    @search = Food.ransack params[:q]
    @result = @search.result

    if @result.blank?
      redirect_to root_path
    end
    if session[:user_id]
      @users_favorite = Favorite.where(user_id: session[:user_id])
    end
  end

  def new
    @food = Food.new
    @point = Point.all
  end

  def create
    @food = Food.new(food_params)
    unless @food.valid?
      @point = Point.all
      @food.errors.add(:point, "Point select please.") unless params[:point].present?
      @food.errors.add(:image, "select please.") unless params[:image].present?
      render :new and return
    end

    submit_point_id = []
    params[:point].map { |id| submit_point_id << id[:id].to_i}
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
