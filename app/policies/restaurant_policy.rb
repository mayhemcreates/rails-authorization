class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      user.admin? ? scope.all : scope.where(user: user)
      # scope.where(user: user) # If users can only see their restaurantsexi
      # scope.where("name LIKE 't%'") # If users can only see restaurants starting with `t`
    end
  end

  def create?
    true
  end

  def show?
    true
  end

  # def edit?
  #   # if the user is the owner of the restaurant => true
  #   # otherwise => false
  #   # c.f. application_policy: user => current user
  #   # record => @restaurant (the argument passed to 'authorize')
  #   record.user == user
  # end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end
end
