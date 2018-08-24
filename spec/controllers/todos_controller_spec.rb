# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Todos API', type: :request do

  let!(:todos) { create_list(:todo, 10) }
  let(:todo_id) { todos.first.id }

  describe 'GET /todos' do
    before { get '/api/todos' }

    it 'returns todos' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'return code status 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /todos/:id' do
    before { get "/api/todos/#{todo_id}" }

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

  describe 'POST /todos' do
    let(:valid_attr) { { todo: { title: 'Go away', created_by: '1' } } }

    context 'request is valid' do
      before { post '/api/todos', params: valid_attr }

      it 'creates todo' do
        expect(json['title']).to eq('Go away')
      end

      it 'return status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'request is invalid' do
      let(:valid_attr) { { todo: { title: 'Go away', created_by: '1' } } }
      before { post '/api/todos', params: { todo: { title: 'Spec' } } }

      it 'returns not the found record ' do
        expect(response.body).to match(/Validation failed: Created by can't be blank/)
      end

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
    end

  end

  describe 'PUT /todos/:id' do
    let(:valid_attr) { { todo: { title: 'Go away' } } }

    context 'record is exists' do
      before { put "/api/todos/#{todo_id}", params: valid_attr }

      it 'update the record' do
        expect(response.body).to be_empty
      end

      it 'return status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE /todos/:id' do
    before { delete "/api/todos/#{todo_id}" }

    it 'return status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end