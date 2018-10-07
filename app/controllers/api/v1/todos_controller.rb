# frozen_string_literal: true

module Api
  module V1
    class TodosController < ApplicationController
      before_action :set_todo, only: %i[show update destroy]

      def index
        @todos = policy_scope(Todo).paginate(page: params[:page], per_page: 20)
        json_response(@todos)
      end

      def show
        json_response(@todo)
      end

      def create
        @todo = current_user.todos.create!(todo_params)
        json_response(@todo, :created)
      end

      def update
        @todo.update(todo_params)
        head :no_content
      end

      def destroy
        authorize @todo
        @todo.destroy
        head :no_content
      end

      private

      def set_todo
        @todo = Todo.find(params[:id])
      end

      def todo_params
        params.require(:todo).permit(:title, :created_by)
      end
    end
  end
end
