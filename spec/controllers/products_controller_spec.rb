require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  # let(:user) {User.create!(email:'peter@example.com', password:'1234567890')}

  before do
    @admin = FactoryBot.create(:admin)
    @product =FactoryBot.create(:product)
  end

  describe 'GET #edit' do
    context 'when user is logged in' do
      before do
        sign_in @admin
      end

      it "can edit product when confimed" do
          get :edit, params: {id: @product}
          expect(response).to be_ok
          expect(assigns(:product)).to eq @product
      end
    end
  end

end
