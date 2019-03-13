require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  let(:user) {User.create!(email:'mjennings6@gmail.com', password:'password')}
  let(:product) {Product.create!(name:"body oil")}

  describe 'GET #edit' do
    context 'when user is logged in' do
      before do
        sign_in user
      end

      it 'can edit product' do
        get :edit, params: {id: product.id}
        expect(response).to be_ok
      end
    end
  end
end
