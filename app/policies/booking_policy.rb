class BookingPolicy < ApplicationPolicy
 attr_reader :current_user

  def initialize(current_user, booking)
    @current_user = current_user
    @tool = booking.tool
    @booking = booking
  end

  def new?
    create?
  end

  def create?
    @tool.user != @current_user
    #true
  end

  def show?
    true
  end

  def edit?
    update?
    # true
  end

  def update?
    @booking.user == @current_user
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
