class ItemsController < ApplicationController
  before_action :authenticate_user!,only: [:new,:edit]
  before_action :set_item, only: [:edit, :show,:update]
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
    @user = @item.user
  end

  def edit
    unless user_signed_in? && current_user.id == @item.user_id
      redirect_to action: :index
    end
  end

  def update
    if @item.update(item_params)
       redirect_to item_path
   else
    render :edit
   end
  end

  def destroy
    item = Item.find(params[:id])
    if item.user != current_user
      redirect_to  root_path
    else
      item.destroy
      redirect_to root_path
    end
  end


  private

  def item_params
    params.require(:item).permit(:product_name,:product_description,:category_id,:condition_id,:contribution_id,:prefecture_id,:delivery_id,:price,:image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
