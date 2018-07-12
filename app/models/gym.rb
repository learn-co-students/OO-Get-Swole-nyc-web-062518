class Gym
 ALL = []

  attr_reader :name

  def initialize(name)
    @name = name
    ALL << self

  end

  def self.all
    ALL
  end

  def memberships
    Membership.all.select {|membership| membership.gym == self}
  end

  def lifters
    memberships.map {|membership| membership.lifter}
  end

  def lifter_names
    lifters.map {|lifter| lifter.name}
  end

  def lift_total_for_gym
    gym_lift_total = 0
    lifters.each do |lifter|
      gym_lift_total += lifter.lift_total
    end
    gym_lift_total
  end

end
