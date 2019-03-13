require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:user) {User.create!(email:'mjennings6@gmail.com', password:'password')}
  let(:product) {Product.create!(name:"body oil")}

  context 'when user is logged in' do
    before do
      sign_in user
    end

    it 'can leave comments' do
      post :create, params: {product_id: product.id, comment: {body:"love it", rating: 5}}
      expect(response).to have_http_status(302)
    end
  end
end
