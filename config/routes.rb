# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    scope module: :v1, constraints: ApiVersion.new('v1', true) do
      resources :todos do
        resources :items
      end
    end
  end
end
