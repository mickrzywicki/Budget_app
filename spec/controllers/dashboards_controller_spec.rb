require 'rails_helper'

RSpec.describe DashboardsController, type: :controller do
  describe 'GET index' do

    before do
      user = create(:user)
      sign_in user
      get :index
    end

    context 'from login user' do
      it 'should return 200:OK' do
        expect(response).to have_http_status(:success)
      end
    end
  end
end

