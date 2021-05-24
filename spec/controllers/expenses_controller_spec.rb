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

      it 'successful redirect after POST' do
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
             params: {
               expense: {
                 name: 'T',
                 price: 2.565,
                 paid_on: Date.tomorrow
               }
             }
      end

      it 'has invalid name' do
        expect(flash[:danger]).to eq I18n.t('flash.controller.bad_create')
      end

      it 'render new template' do
        expect(response).to render_template('expenses/new')
      end
    end
  end

  describe 'GET #edit' do
    let(:user) { create(:user) }
    let(:expense) { create(:expense) }

    context 'from login user' do
      before do
        sign_in user
        get :edit, params: { id: expense.id }
      end

      it 'should return 200:OK' do
        expect(response).to have_http_status(:success)
      end

      it 'renders the edit template' do
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'PUT #update' do
    let(:user) { create(:user) }
    let(:expense) { create(:expense) }

    context 'from login user and valid attributes' do
      before do
        sign_in user
        patch :update,
              params: {
                id: expense.id,
                expense: {
                  name: 'Potato',
                  price: 3.78,
                  paid_on: Date.yesterday
                }
              }
      end

      it 'successful redirect after PUT' do
        expect(response).to redirect_to('/expenses')
      end

      it 'create flash message' do
        expect(flash[:success]).to eq I18n.t('flash.controller.good_update')
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
        patch :update,
              params: {
                id: expense.id,
                expense: {
                  name: 'T',
                  price: 3.787,
                  paid_on: Date.tomorrow
                }
              }
      end

      it 'has invalid name' do
        expect(flash[:danger]).to eq I18n.t('flash.controller.bad_update')
      end

      it 'render new template' do
        expect(response).to render_template('expenses/edit')
      end
    end
  end

  describe 'DELETE #destroy' do
    let(:user) { create(:user) }
    let(:expense) { create(:expense) }

    context 'from login user and valid attributes' do
      before do
        sign_in user
        delete :destroy,
               params: {
                 id: expense.id
               }
      end

      it 'successful redirect after DELETE' do
        expect(response).to redirect_to('/expenses')
      end

      it 'create flash message' do
        expect(flash[:success]).to eq I18n.t('flash.controller.good_delete')
      end

      it 'has 302:Redirect' do
        expect(response).to have_http_status(:redirect)
      end

      it 'delete record from database with success' do
        expect(Expense.count).to eq(0)
      end
    end
  end
end
