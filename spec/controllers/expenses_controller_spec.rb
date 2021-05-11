require 'rails_helper'

RSpec.describe ExpensesController, type: :controller do
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

      it 'renders the index template' do
        expect(response).to render_template('index')
      end
    end
  end

  describe 'Not GET index' do
    it 'should redirect without login' do
      get :index
      expect(response).to have_http_status(:redirect)
    end
  end
end
