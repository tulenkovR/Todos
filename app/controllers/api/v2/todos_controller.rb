# frozen_string_literal: true

module Api
  module V2
    class TodosController < ApplicationController
      def index
        json_response(message: 'Hello there')
      end
    end
  end
end
