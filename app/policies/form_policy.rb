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

  def show?
    true
  end

  def create?
    return true
  end

end
