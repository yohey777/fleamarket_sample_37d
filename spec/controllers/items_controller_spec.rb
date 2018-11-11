require 'rails_helper'

describe ItemsController, type: :controller do
  render_views
  let(:item){create(:item)}

  describe 'GET #new' do
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

   describe 'POST #create' do
    it 'item successfully saved' do
        item = build(:item)
        expect{item.save}.to change{Item.count}.by(1)
        expect(item.save).to be_truthy
    end

    it 'item not successfully saved' do
        item = Item.new
        expect(item.save).to be_falsey
    end
  end
end
