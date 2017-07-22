class BrandPolicy < ApplicationPolicy
  def initalize(user, brand)
    super
  end

  def proper_owner?(user, brand)
    brand.proper_owner?(user)
  end

  def available_to_show?(user, brand)
    return true if entry.published
    entry.proper_owner?(user)
  end
end