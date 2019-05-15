require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  # let(:user) {User.create!(email:'peter@example.com', password:'1234567890')}

  before do
    @admin = FactoryBot.create(:admin)
    @user = FactoryBot.create(:user)
    @product =FactoryBot.create(:product)
  end

  describe 'GET #index' do
    it "renders products" do
      get :index
    end
  end

  describe 'GET #show' do
    it 'renders chosen product' do
      get :show, params:{ id: @product}
      expect(assigns(:product)).to eq @product
    end
  end

  describe 'GET #new' do
    context 'when user is logged in and has admin role' do
      before do
        sign_in @admin
      end

      it 'renders the new product template' do
        get :new
        expect(response).to be_ok
        expect(response).to render_template('new')
      end
    end

    context 'when user is logged in and does not have admin role' do
      before do
        sign_in @user
      end

      it 'redirect to root' do
        get :new
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path)
      end
    end

    context 'when user is not logged in' do
      it 'redirect to root' do
        get :new
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path)
      end
    end
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

    context 'when user is logged in with no admin role' do
      before do
        sign_in @user
      end

      it 'redirects to root' do
        get :new
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe 'POST #create' do
    context 'when user logged in with admin role' do
      before do
        sign_in @admin
      end

      it 'creating new product' do
        @product2 = FactoryBot.create(:product)
        expect(response).to have_http_status(:success) # 200
        expect(response).to be_successful
      end
    end

    context 'when user does not have admin role' do
      before do
        sign_in @user
      end

      it 'redirects to root' do
        get :new
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path)
      end
    end

    context 'when user is not logged in' do
      it 'redirects to root' do
        get :new
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe 'PATCH/PUT #update' do
    context 'when logged in with admin role' do
      before do
        sign_in @admin
      end

      it 'update product details' do
        put :update, params: {id: @product, product: {name: '', description:'', image_url: '', scents:'', price:''}}
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe 'DELETE #destroy'do
    context 'when logged in with admin role' do
      before do
        sign_in @admin
      end

      it 'delete product' do
        delete :destroy, params: {id: @product}
        expect(response).to redirect_to(products_path)
      end
    end

    context 'when logged in without admin role' do
      before do
        sign_in @user
      end

      it 'cannot delete product' do
        delete :destroy, params: {id: @product}
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path)
      end
    end
  end

end
