class BookingPolicy < ApplicationPolicy
 attr_reader :current_user

  def initialize(current_user, tool, booking)
    @current_user = current_user
    @tool = tool
    @booking = booking
  end

  def new?
    create?
  end

  def create?
    true
  end

  def show?
    true
  end

  def edit?
    update?
  end

  def update?
    @tool.user == @current_user
    true
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
