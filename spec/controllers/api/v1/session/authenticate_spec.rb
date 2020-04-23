# frozen_string_literal: true

require 'rails_helper'

describe API::V1::Session::Authenticate, type: :request do
  let!(:user) { create :user, email: 'user@example.com', password: 'Start!123' }

  describe 'GET /api/v1/session' do
    subject(:response) do
      get '/api/v1/session'
      @response
    end

    context 'user is logged in' do
      before do
        login_as(user, scope: :user)
      end

      its(:status) { is_expected.to eq 200 }

      describe 'responded user' do
        subject { JSON.parse(response.body) }

        it do
          expect(subject['email']).to eq 'user@example.com'
        end
      end
    end

    context 'user is not logged in' do
      its(:status) { is_expected.to eq 401 }
    end
  end
end
