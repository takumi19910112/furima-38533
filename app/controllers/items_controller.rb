class ItemsController < ApplicationController
  before_action :authenticate_user!,only: [:new]
  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  def show
    @item = Item.find(params[:id])
    @user = @item.user
  end



  private

  def item_params
    params.require(:item).permit(:product_name,:product_description,:category_id,:condition_id,:contribution_id,:prefecture_id,:delivery_id,:price,:image).merge(user_id: current_user.id)
  end
end
