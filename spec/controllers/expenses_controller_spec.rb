require 'rails_helper'

RSpec.describe ExpensesController, type: :controller do
  describe 'GET index' do
    let(:user) { create(:user) }
    let(:expense) { create(:expense) }

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

      it 'assigns @expenses' do
        expect(assigns(:expenses)).to eq([expense])
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

  describe 'GET #new' do
    let(:user) { create(:user) }

    context 'from login user' do
      before do
        sign_in user
        get :new
      end

      it 'should return 200:OK' do
        expect(response).to have_http_status(:success)
      end

      it 'renders the new template' do
        expect(response).to render_template('new')
      end
    end
  end
end
