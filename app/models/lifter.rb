
class Lifter
  ALL = []

  attr_reader :name, :lift_total

  def initialize(name, lift_total)
    @name = name
    @lift_total = lift_total
    ALL << self
  end

  def self.all # Get a list of all lifters
    ALL
  end

  def memberships #returns an array of all memberships of that lifter
    Membership.all.select do |membership|
      membership.lifter == self
    end
  end

  def gyms #returns an array of all gyms that lifter has memberships to
    self.memberships.map do |membership|
      membership.gym
    end
  end

  def self.average_lift #returns the average lift_total of all lifters
    lift_sum = 0
    all.each do |lifter|
      lift_sum += lifter.lift_total
    end
    lift_sum/all.length
  end

  def sign_up(cost, gym) #creates a new Membership and associates a lifter and gym
    Membership.new(self, gym, cost)
  end

  def total_cost  #returns a sum of the total cost of lifter's gym memberships
    total_cost = 0
    memberships.each do |membership|
      total_cost += membership.cost
    end
    total_cost
  end

end
