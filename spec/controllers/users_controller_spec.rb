require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  # let(:user) {@user = FactoryBot.create(:user)}

  before do
    @user = FactoryBot.create(:user)
    # user2 = @user2
  end

  describe 'GET #show' do
    context 'when a user is logged in' do

      before do
        sign_in @user
      end

      it 'loads correct user details' do
        get :show, params: {id: @user.id}
        expect(response).to be_ok
        expect(assigns(:user)).to eq @user
      end

    #   it 'cannot access another users page' do
    #     get:show, params: {id: user.id} #user2 should be here
    #     expect(response).to have_http_status(401)
    #     expect(response).to redirect_to(root_path)
    #   end
    end

    context 'when a user is not logged in' do
      it 'redirects to login' do
        get :show, params: {id: @user.id}
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

end
