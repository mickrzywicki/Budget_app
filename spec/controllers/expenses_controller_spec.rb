require 'rails_helper'
require_relative '../support/devise'

RSpec.describe ExpensesController, type: :controller do
  describe 'GET index' do
    login_user

    context 'from login user' do
      it 'should return 200:OK' do
        get :index
        expect(response).to have_http_status(:success)
      end

      it 'renders the index template' do
        get :index
        expect(response).to render_template("index")
      end
    end
  end

  # Wątpliwe że przydatne ale zostawie jak narazie, ale
  # nie potrzebna redundancja.
  describe 'Not GET index' do
    it 'should not success without login' do
      get :index
      expect(response).not_to have_http_status(:success)
    end
  end
end
