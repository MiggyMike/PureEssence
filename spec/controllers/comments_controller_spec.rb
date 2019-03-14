require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  before do
    @user = FactoryBot.create(:user)
    @product =FactoryBot.create(:product)
  end


  context 'when user is logged in' do
    before do
      sign_in @user
    end

    it 'can leave comments' do
      post :create, params: {product_id: @product, comment: {body:"love it", rating: 5}}
      expect(response).to have_http_status(302)
    end
  end
end
