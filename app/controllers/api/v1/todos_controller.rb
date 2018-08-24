# frozen_string_literal: true

module Api
  module V1
    class TodosController < ApplicationController
      def index
        @todos = Todo.all
        json_response(@todos)
      end
    end
  end
end
