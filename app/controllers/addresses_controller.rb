class AddressesController < ApplicationController

  before_action :set_user

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
      if @address.save
        redirect_to method_of_payment_items_path
      else
        render 'new'
      end
  end

  def set_user
    @user = User.find(params[:user_id])
  end


  private
  def address_params
    params.require(:address).permit(
      :first_name,
      :last_name,
      :first_name_kana,
      :last_name_kana,
      :postal_code,
      :prefecture_code,
      :city,
      :street_number,
      :building_name,
      :telephone_number,
      ).merge(user_id: current_user.id)
  end
end
