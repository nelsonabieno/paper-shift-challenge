require 'rails_helper'

RSpec.describe 'User Events', type: :request do
  # initialize test data
  let(:event) { create :event }
  let(:user) { create :user }

  # Test suite for PUT /api/v1/users/:user_id/events/:id
  describe 'PUT /api/v1/users/:user_id/events/:id' do
    context 'when an event is assigned to a user ' do
      before { put "/api/v1/users/#{user.id}/events/#{event.id}" }

      it 'returns a non empty response' do
        expect(response.body).not_to be_empty
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns a success message' do
        expect(response.body.message).to match('Event successfully assigned to user')
      end

      it 'returns a non empty user' do
        expect(response.body.user).not_to be_empty
      end

      it 'returns user name and email whom event was assigned to' do
        expect(response.body.user['name']).to match('Pascal')
        expect(response.body.user['email']).to match('test_pascal@gmail.com')
      end

      it 'returns user events' do
        expect(response.body.user_events).not_to be_empty
      end
    end

    context 'when the event and user does not exist' do
      before { put '/api/v1/users/hu99/events/u8h' }
      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end
  end

  # Test suite for DELETE /api/v1/users/:user_id/events/:id
  describe 'DELETE /api/v1/users/:user_id/events/:id' do
    context 'when an event is unassigned from a user ' do
      before { delete "/api/v1/users/#{user.id}/events/#{event.id}" }

      it 'returns a non empty response' do
        expect(response.body).not_to be_empty
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns a success message' do
        expect(response.body.message).to match('Event successfully unassigned from User')
      end
    end

    context 'when the user and event does not exist' do
      before { delete '/api/v1/users/hu99/events/u8h' }
      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end
  end
end
