# frozen_string_literal: true

require 'rails_helper'

describe API::V1::Session::Logout, type: :request do
  let!(:user) { create :user }

  describe 'DELETE /api/v1/session' do
    subject(:request) do
      delete '/api/v1/session'
      @request
    end

    before do
      login_as(user, scope: :user)
    end

    describe 'response' do
      subject do
        request
        response
      end

      its(:status) { is_expected.to eq 200 }
    end

    it 'should logout user' do
      expect(request.env['warden']).not_to be_authenticated(:user)
    end
  end
end
