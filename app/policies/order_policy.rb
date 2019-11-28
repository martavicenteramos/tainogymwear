class OrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    record.user == user
  end

  def cart?
    true
  end

  def checkout?
    true
  end
end
