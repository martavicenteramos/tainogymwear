class WishlistPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def destroy?
    record.user == user
  end

  def index?
    record.user == user
  end
end

# WTF
