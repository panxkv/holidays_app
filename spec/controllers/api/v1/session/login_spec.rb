# frozen_string_literal: true

require 'rails_helper'

describe API::V1::Session::Login, type: :request do
  let!(:user) { create :user, email: 'user@example.com', password: 'Start!123' }
  let(:email) {}
  let(:password) {}
  let(:params) { { email: email, password: password } }

  describe 'POST /api/v1/session' do
    subject(:request) do
      cookies['_session_id'] = 'session-id'
      post '/api/v1/session', params: params
      @request
    end

    shared_examples 'request with unauthorized response' do
      describe 'response' do
        subject(:response) do
          request
          @response
        end
        its(:status) { is_expected.to eq 401 }
      end
    end

    context 'when email is wrong' do
      let(:email) { 'notuser@example.com' }
      let(:password) { 'Start!123' }

      it_behaves_like 'request with unauthorized response'

      it 'should not authenticate user' do
        expect(request.env['warden']).not_to be_authenticated(:user)
      end
    end

    context 'when password is wrong' do
      let(:email) { 'user@example.com' }
      let(:password) { 'notStart!123' }

      it_behaves_like 'request with unauthorized response'

      it 'should not authenticate user' do
        expect(request.env['warden']).not_to be_authenticated(:user)
      end
    end

    context 'when password and email are correct' do
      let(:email) { 'user@example.com' }
      let(:password) { 'Start!123' }

      describe 'response' do
        it 'should have status 201' do
          request
          expect(@response.status).to eq 201
        end
      end

      it 'should not authenticate user' do
        expect(request.env['warden']).to be_authenticated(:user)
      end
    end
  end
end
