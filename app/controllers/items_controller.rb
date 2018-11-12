class ItemsController < ApplicationController

  def index

  end

  def show
    @item = Item.find(params[:id])
    @images = @item.images.order("created_at DESC")
  end

  def new
    @item = Item.new
    @item.images.build

  end

  def create
    @item = Item.create(create_params)
    if @item.save
      redirect_to root_path
    else
      redirect_to new_item_path
    # current_user.products.create(create_params)
    end

  end

  def buy

  end

  private

  def create_params
    params.require(:item).permit(:name, :price, :description, :status, :prefecture, :expense, :shipping_method, :arrival_date, :like_count, :L_category_id, :M_category_id, :S_category_id, :size_id, :brand_id, images_attributes:[:id, :image_url, :item_id]).merge(user_id: current_user.id)
  end

  def method_of_payment

  end


  def payment
    require 'payjp'
    # Payjp.api_key = 'sk_test_c62fade9d045b54cd76d7036'
     Payjp.api_key = PAYJP_SECRET_KEY
    Payjp::Charge.create(currency: 'jpy', amount: 1000, card: params['payjp-token'])
    redirect_to method_of_payment_items_path, notice: "支払いが完了しました"
  end

end
