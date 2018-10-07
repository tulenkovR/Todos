# frozen_string_literal: true

class ApplicationController < ActionController::API
  include Pundit
  include Response
  include ExceptionHandler

  # called before every action on controllers
  before_action :authorize_request
  attr_reader :current_user

  def current_admin
    @admin
  end

  private

  def pundit_user
    Context::UserContext.new(current_user, current_admin)
  end

  # Check for valid request token and return user
  def authorize_request
    @current_user = (AuthorizeApiRequest.new(request.headers).call)[:user]
    @admin = @current_user if @current_user.admin
  end
end
