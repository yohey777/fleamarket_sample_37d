class ImagesController < ApplicationController
  def create
    @image = @item.images.new(create_params)
  end

  private
  def create_params
    params.require(:image).permit(:item_id, :file)
  end
end
