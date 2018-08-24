# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Todos API', type: :request do
  let!(:todos) { create_list(:todo, 10) }
  let(:todo_id) { todos.first.id }

  describe 'GET /todos' do
    before { get '/api/todos' }

    it 'returns todos' do
      expect(response).to have_http_status(:ok)
      # expect(json).not_to be_empty
      #   # expect(json.size).to eq(10)
    end

    it 'return code status 200' do
      expect(response).to have_http_status(200)
    end

  end
end