class ItemsController < ApplicationController

  def index

  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
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
