# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Items API', type: :request do
  let(:user) { create(:user) }
  let!(:todo) { create(:todo, created_by: user.id) }
  let!(:items) { create_list(:item, 20, todo_id: todo.id) }
  let(:todo_id) { todo.id }
  let(:id) { items.first.id }
  let(:headers) { valid_headers }

  describe 'GET /api/:todo_id/items' do
    before { get "/api/todos/#{todo_id}/items", headers: headers }

    context 'todo exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all items' do
        expect(json).not_to be_empty
        expect(json.size).to eq(20)
      end

    end

    context 'todo not exists' do
      let(:todo_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns not found message' do
        expect(response.body).to match(/Couldn't find Todo/)
      end
    end

  end

  describe 'GET /api/todos/:todo_id/items/:id' do
    before { get "/api/todos/#{todo_id}/items/#{id}", headers: headers }

    context 'todo item exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns item' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(id)
      end

    end

    context 'todo item does not exists' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns not found message' do
        expect(response.body).to match(/Couldn't find Item/)
      end
    end
  end

  describe 'POST /api/todos/:todo_id/items' do
    let(:valid_attr) { { name: 'Go away', done: false }.to_json }

    context 'request attributes are valid' do
      before { post "/api/todos/#{todo_id}/items", params: valid_attr, headers: headers }

      it 'returns status code 201' do
        expect(response).to have_http_status(:created)
      end

    end

    context 'invalid request' do
      before { post "/api/todos/#{todo_id}/items", params: { name: '' }.to_json, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Name can't be blank/)
      end
    end
  end

  describe 'PUT /api/todos/:todo_id/items/:id' do
    let(:valid_attr) { { done: true }.to_json }
    before { put "/api/todos/#{todo_id}/items/#{id}", params: valid_attr, headers: headers }

    context 'item exists' do

      it 'update the record' do
        item = Item.find(id)
        expect(item.done).to eq true
      end

      it 'return status code 204' do
        expect(response).to have_http_status(204)
      end
    end

    context 'item does not exist' do
      let(:id) { 0 }

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Item/)
      end

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

    end
  end

  describe 'DELETE /api/todos/:todo_id/items/:id' do
    before { delete "/api/todos/#{todo_id}/items/#{id}", headers: headers }

    it 'return status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
