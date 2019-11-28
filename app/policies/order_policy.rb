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

  def update?
    record.user == user
  end

  def edit?
    update?
  end

  def review_information?
    record.user == user
  end
end
