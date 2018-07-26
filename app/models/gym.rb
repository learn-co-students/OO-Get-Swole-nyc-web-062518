class Gym
 ALL = []

  attr_reader :name

  def initialize(name)
    @name = name
    ALL << self
  end

  def self.all # Get a list of all gyms
    ALL
  end

  def memberships #returns an array of all of that gym's memberships
    Membership.all.select do |membership|
      membership.gym == self
    end
  end

  def lifters #returns an array of all of that gym's lifters
    memberships.map do |membership|
      membership.lifter
    end
  end

  def lifter_names #returns an array of all the names of that gym's lifters
    memberships.map do |membership|
      membership.lifter.name
    end

  end

  def lift_total_for_gym #returns a sum of lift_totals for all the lifters at that gym
    lift_total_sum = 0
    lifters.each do |lifter|
      lift_total_sum += lifter.lift_total
    end
    lift_total_sum
  end
end
