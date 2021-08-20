class VideoGamePolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end
  
  def create?
    true
  end

  def update?
    user_is_owner?
  end

  def destroy?
    user_is_owner?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  private
  def user_is_owner?
    record.user == user
  end
end
