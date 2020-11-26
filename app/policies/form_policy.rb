class FormPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    def show?
      true
    end

    def answers?
      true
    end
  end

  def success?
    true
  end


  def show?
    true
  end

  def create?
    return true
  end

  def update?
    record.user == user
  end

end
