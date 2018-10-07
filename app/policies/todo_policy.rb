class TodoPolicy < ApplicationPolicy

  def destroy?
    return true if user.admin?
  end

  class Scope
    attr_reader :user_context, :scope, :user, :admin

    def initialize(user_context, scope)
      @user_context = user_context
      @scope = scope
      @admin = user_context.admin
      @user = user_context.user
    end

    def resolve
      if admin
        scope.all
      else
        scope.where(created_by: user.id)
      end
    end

  end

end
