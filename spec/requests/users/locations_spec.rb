require 'rails_helper'

RSpec.describe 'User Locations', type: :request do
  # initialize test data
  let(:location) { create :location }
  let(:user) { create :user }


  # Test suite for PUT /api/v1/users/:user_id/locations/:id
  describe 'PUT /api/v1/users/:user_id/locations/:id' do

    context 'when a location is assigned to a user ' do
      before { put "/api/v1/users/#{user.id}/locations/#{location.id}" }
      it 'returns a non empty response' do
        expect(response.body).not_to be_empty
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns a success message' do
        expect(response.body.message).to match('Location successfully assigned to user')
      end

      it 'returns a non empty user' do
        expect(response.body.user).not_to be_empty
      end

      it 'returns user name and email whom location was assigned to' do
        expect(response.body.user['name']).to match('Pascal')
        expect(response.body.user['email']).to match('test_pascal@gmail.com')
      end

      it 'returns user location name' do
        expect(response.body.user_locations).not_to be_empty
        expect(response.body.user_locations).to match('London')
      end
    end

    context 'when the user and location does not exist' do
      before { put '/api/v1/users/hu99/locations/u8h' }
      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end
  end

  # Test suite for DELETE /api/v1/users/:user_id/locations/:id
  describe 'DELETE /api/v1/users/:user_id/locations/:id' do
    context 'when an event is unassigned from a user ' do
      before { delete "/api/v1/users/#{user.id}/locations/#{location.id}" }

      it 'returns a non empty response' do
        expect(response.body).not_to be_empty
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns a success message' do
        expect(response.body.message).to match('Location successfully unassigned from User')
      end
    end

    context 'when the user and location does not exist' do
      before { delete '/api/v1/users/hu99/locations/u8h' }
      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end
  end
end
