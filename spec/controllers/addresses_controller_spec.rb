require 'rails_helper'

describe AddressesController do

  let(:user) { create(:user) }

  describe '#new' do
    context 'log in' do
      before do
        login user
        get :new, params: { user_id: user.id }
      end

      it 'assigns @address' do
        expect(assigns(:address)).to be_a_new(Address)
      end

      it 'assigns @user' do
        expect(assigns(:user)).to eq user
      end

      it 'redners new' do
        expect(response).to render_template :new
      end
    end
  end
  describe '#create' do
    let(:user) { create(:user)}
    let(:params) { { user_id: user.id, address: attributes_for(:address) } }
    context 'log in' do
      before do
        login user
      end
      context 'can save' do
        subject {
          post :create,
          params: params
        }
        it 'count up address' do
          expect{ subject }.to change(Address, :count).by(1)
        end
        it 'redirects to root_path' do
          subject
          expect(response).to redirect_to( method_of_payment_items_path)
        end
      end
      context 'can not save' do
        let(:invalid_params) { { user_id: user.id, address: attributes_for(:address, first_name: nil, last_name: nil, first_name_kana: nil, last_name_kana: nil, postal_code: nil, prefecture_code: nil, city: nil, street_number: nil, building_name: nil) } }
        subject {
          post :create,
          params: invalid_params
        }
        it 'does not count up' do
          expect{ subject }.not_to change(Address, :count)
        end
        it 'renders new' do
          subject
          expect(response).to render_template :new
        end
      end
    end
  end
end

