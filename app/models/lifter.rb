require 'pry'

class Lifter

  @@all = []

  attr_reader :name, :lift_total

  def initialize(name, lift_total)
    @name = name
    @lift_total = lift_total
    @@all << self
  end

  def self.all
    @@all
  end

  def memberships
    Membership.all.select do |membership|
      membership.lifter == self
    end
  end

  def gyms
    memberships.map do |membership|
      membership.gym
    end
  end

  def self.average_lift_total
    total = 0
    self.all.each do |lifter|
      total =+ lifter.lift_total
    end
    total/self.all.count
  end

  def total_cost
    total = 0
    memberships.each do |membership|
      total += membership.cost
    end
    total
  end

  def sign_lifter_to_new_gym(membership_cost, gym)
    Member.new(membership_cost, gym, self)
  end

end
