require 'rails_helper'

RSpec.describe DashboardsController, type: :controller do
  describe 'GET index' do
    let(:user) { create(:user) }

    context 'from login user' do
      before do
        sign_in user
        get :index
      end

      it 'should return 200:OK' do
        expect(response).to have_http_status(:success)
      end

      it 'renders the index template' do
        expect(response).to render_template('index')
      end
    end

    context 'from guest user' do
      before do
        get :index
      end

      it 'should redirect without login' do
        expect(response).to have_http_status(:redirect)
      end
    end
  end
end

