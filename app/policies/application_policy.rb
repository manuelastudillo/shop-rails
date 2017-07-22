class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    false
  end

  def show?
    scope.where(:id => record.id).exists?
  end

  def create?
    false
  end

  def new?
    create?
  end

 def update?
    check_if_admin(@user) || proper_owner?(@user, @record)
  end

  def edit?
    update?
  end

  def destroy?
    check_if_admin(@user) || proper_owner?(@user, @record)
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end


  def check_if_admin(user)
    return false unless user
    user.admin?
  end
end
