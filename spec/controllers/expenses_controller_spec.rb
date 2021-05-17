require 'rails_helper'

RSpec.describe ExpensesController, type: :controller do
  # Testing 'index' template with get :index
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

  # Testing 'new' template with get :new
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

  # Testing 'create' template with POST action
  describe 'POST #create' do
    let (:user) { create(:user) }

    context 'from login user and valid attributes' do
      before do
        sign_in user
        post :create,
             params: { expense: {
               name: 'Tomato',
               price: 2.56,
               paid_on: Date.today
             } }
      end

      it 'successfull redirect after POST' do
        expect(response).to redirect_to('/expenses')
      end

      it 'create flash message' do
        expect(flash[:success]).to eq I18n.t('flash.controller.good_create')
      end

      it 'has 302:Redirect' do
        expect(response).to have_http_status(:redirect)
      end

      it 'save record to database with success' do
        expect(Expense.count).to eq(1)
      end
    end

    context 'from login user and invalid attributes' do
      before do
        sign_in user
        post :create,
             params: { expense: {
               name: 'T',
               price: 2.565,
               paid_on: Date.tomorrow
             } }
      end

      it 'has invalid name' do
        expect(flash[:danger]).to eq I18n.t('flash.controller.bad_create')
      end

      it 'has not redirect to /expense' do
        expect(response).to render_template('expenses/new')
      end
    end
  end
end
