require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  # Create a user for sign_in or not, depends on tests
  let(:user) { create(:user) }
  # Testing 'new' template with get :new
  describe 'GET #new' do
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
    context 'from login user and valid attributes' do
      before do
        sign_in user
        post :create,
             params: {
               category: {
                 name: 'Fruits'
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
        expect(Category.count).to eq(1)
      end
    end

    context 'from login user and invalid attributes' do
      before do
        sign_in user
        post :create,
             params: {
               category: {
                 name: 'T'
               }
             }
      end

      it 'has invalid name' do
        expect(flash[:danger]).to eq I18n.t('flash.controller.bad_create')
      end

      it 'render new template' do
        expect(response).to render_template('categories/new')
      end
    end
  end

  describe 'GET #edit' do
    let(:user) { create(:user) }
    let(:category) { create(:category) }

    context 'from login user' do
      before do
        sign_in user
        get :edit, params: { id: category.id }
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
    let(:category) { create(:category) }

    context 'from login user and valid attributes' do
      before do
        sign_in user
        patch :update,
              params: {
                id: category.id,
                category: {
                  name: 'Vegetables'
                }
              }
      end

      it 'successful redirect after PUT' do
        expect(response).to redirect_to('/categories')
      end

      it 'create flash message' do
        expect(flash[:success]).to eq I18n.t('flash.controller.good_update')
      end

      it 'has 302:Redirect' do
        expect(response).to have_http_status(:redirect)
      end

      it 'save record to database with success' do
        expect(Category.count).to eq(1)
      end
    end

    context 'from login user and invalid attributes' do
      before do
        sign_in user
        patch :update,
              params: {
                id: category.id,
                category: {
                  name: 'T'
                }
              }
      end

      it 'has invalid name' do
        expect(flash[:danger]).to eq I18n.t('flash.controller.bad_update')
      end

      it 'render new template' do
        expect(response).to render_template('categories/edit')
      end
    end
  end
end
