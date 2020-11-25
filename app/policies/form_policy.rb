class FormPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
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

end
