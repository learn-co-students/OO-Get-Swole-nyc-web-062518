


class Lifter

  ALL = []

  attr_reader :name, :lift_total

  def initialize(name, lift_total)
    @name = name
    @lift_total = lift_total
    ALL << self
  end

  def self.all
    ALL
  end

  def memberships
    Membership.all.select {|membership| membership.lifter == self}
  end

  def gyms
    memberships.map {|membership| membership.gym}
  end

  def self.average_lift
    total_lifters = 0
    sum_lifts = 0
    all.each do |lifter|
      sum_lifts += lifter.lift_total
      total_lifters += 1
    end
  sum_lifts / total_lifters
  end

  def sign_up(cost, gym)
    Membership.new(self, gym, cost)
  end

  def total_cost
    # sum_cost = 0
    # memberships.each do |membership|
    #   sum_cost += membership.cost
    # end
    # sum_cost
    costs = memberships.map do |membership|
      membership.cost
    end

    costs.inject(0) do |x,y|
      x + y
    end 
  end


end
