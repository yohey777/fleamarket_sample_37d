class AddressesController < ApplicationController

  def index
  end

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
      if @address.save
        redirect_to users_sign_up_6_path
      end
  end

  private
  def address_params
    params.require(:address).permit(
      :first_name,
      :last_name,
      :first_name_kana,
      :last_name_kana,
      :postal_code,
      :prefecture,
      :city,
      :street_number,
      :building_name,
      :telephone_number,
      ).merge(user_id: current_user.id)
  end
end
