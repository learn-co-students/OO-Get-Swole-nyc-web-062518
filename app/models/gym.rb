require 'pry'

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
    Membership.all.select do |membership|
      membership.gym == self
    end
  end

  def lifters
    memberships.map do |membership|
      membership.lifter
    end
  end

  def lifters_names
    lifters.map do |lifter|
      lifter.name
    end
  end

  def lift_total
    total = 0
    lifters.each do |lifter|
      total += lifter.lift_total
    end
    total
  end

end
