class ItemsController < ApplicationController

  def index

  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
    # @item.images.new
  end

  def create
    @item = Item.new(create_params)
    if @item.save
      redirect_to root_path
    else
      redirect_to new_item_path
    # current_user.products.create(create_params)
    end

  end

  private

  def create_params
    params.require(:item).permit(:name, :price, :description, :status, :prefecture, :expense, :shipping_method, :arrival_date, :like_count, :L_category_id, :M_category_id, :S_category_id, :size_id, :brand_id, :images_attributes [:image])
  end
end
