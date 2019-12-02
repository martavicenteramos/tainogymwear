class OrderProductPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def destroy?
    true
  end

  def add?
    record.order.user == user
  end

  def remove?
    record.order.user == user
  end
end
