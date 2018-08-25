# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Todos API', type: :request do
  let(:user) { create(:user) }
  let!(:todos) { create_list(:todo, 10, created_by: user.id) }
  let(:todo_id) { todos.first.id }
  let(:headers) { valid_headers }

  describe 'GET /api/todos' do
    before { get '/api/todos', headers: headers }

    it 'returns todos' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'return code status 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /api/todos/:id' do
    before { get "/api/todos/#{todo_id}", headers: headers }

    context 'record exists' do

      it 'returns the todo' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(todo_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'record does not exists' do
      let (:todo_id) { 100 }

      it 'returns not the found record ' do
        expect(response.body).to match(/Couldn't find Todo/)
      end

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end
  end

  describe 'POST /api/todos' do
    let(:valid_attr) do
      { title: 'Go away', created_by: user.id.to_s }.to_json
    end

    context 'request is valid' do
      before { post '/api/todos', params: valid_attr, headers: headers }

      it 'creates todo' do
        expect(json['title']).to eq('Go away')
      end

      it 'return status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'request is invalid' do
      let(:invalid_attr) { { todo: { title: '' } }.to_json }
      before { post '/api/todos', params: invalid_attr, headers: headers }

      it 'returns not the found record ' do
        expect(json['message']).to match(/Validation failed: Title can't be blank/)
      end

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
    end

  end

  describe 'PUT /api/todos/:id' do
    let(:valid_attr) { { todo: { title: 'Go away' } }.to_json }

    context 'record is exists' do
      before { put "/api/todos/#{todo_id}", params: valid_attr, headers: headers }

      it 'update the record' do
        expect(response.body).to be_empty
      end

      it 'return status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE /api/todos/:id' do
    before { delete "/api/todos/#{todo_id}", headers: headers }

    it 'return status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end