class ToolPolicy < ApplicationPolicy
  attr_reader :current_user

  def initialize(current_user, tool)
    @current_user = current_user
    @tool = tool
  end

  def new?
    create?
  end
  def create?
    return true
  end

  def show?
    return true
  end

  def edit?
    update?
  end

  def update?
    @tool.user == @current_user
  end

  def destroy?
    update?
  end

  class Scope

    def initialize(current_user, scope)

      @current_user = current_user
      @scope = scope
    end

    def resolve
      @scope.all
    end
  end

end
