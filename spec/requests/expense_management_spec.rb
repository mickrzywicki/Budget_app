require 'rails_helper'

RSpec.describe 'Expenses', type: :request do
  describe 'POST #create' do
    let (:user) { create(:user) }

    context 'from login user' do
      before do
        sign_in user
        post '/expenses', params: { expense: {
          name: 'Tomato',
          price: 2.56,
          paid_on: Date.today
        } }
      end

      it 'create expense with valid attributes' do
        expect(response).to redirect_to('/expenses')
        follow_redirect!
      end

      it 'render index successfully' do
        expect(response).to render_template(:expenses_url)
      end

      it 'has 200:OK' do
        expect(response).to have_http_status(:success)
      end
    end
  end
end
