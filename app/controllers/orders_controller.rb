class OrdersController < ApplicationController
  before_action :authenticate_user!,only: [:index,:create]
  
 def index
  @item = Item.find(params[:item_id])
  @order_address = OrderAddress.new

  if @item.user == current_user
    redirect_to  root_path
  end


  end

  

  def create
    @item = Item.find(params[:item_id])
    @items = Item.includes(:user).order("created_at DESC")
    @order_address = OrderAddress.new(order_params)
   if @order_address.valid?
    pay_item
     @order_address.save
     redirect_to root_path
   else
    render :index
   end
  end
  


  private

  def order_params
    params.require(:order_address).permit(:post_code, :prefecture_id, :municipalities, :phone_number, :building_name, :address).merge(user_id: current_user.id,item_id: params[:item_id],token: params[:token])

  end

     def pay_item
       Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
         Payjp::Charge.create(
           amount: @item.price,  
           card: order_params[:token],   
           currency: 'jpy'                 
         )
      end



end
