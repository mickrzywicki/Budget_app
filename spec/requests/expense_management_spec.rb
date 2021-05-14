require 'rails_helper'

RSpec.describe 'Expenses', type: :request do
  describe 'POST #create' do
    let (:user) { create(:user) }

    context 'from login user' do
      before do
        sign_in user
      end

      it 'create expense with valid attributes' do
        get '/expenses/new'
        expect(response).to render_template(:new)

        post '/expenses', params: { expense: { name: 'Tomato', price: 2.56, paid_on: Date.today } }

        expect(response).to redirect_to('/expenses')
        follow_redirect!

        expect(response).to render_template(:index)
        expect(response).to have_http_status(:success)
      end
    end
  end
end
