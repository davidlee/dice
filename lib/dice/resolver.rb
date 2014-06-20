module Dice
  class Resolver

    attr_reader :num_rolls, :sides, :modifier, :rolls

    def initialize(num_rolls, sides, modifier)
      @num_rolls = num_rolls
      @sides     = sides
      @modifier  = modifier
    end

    def result
      @result ||= perform_rolls
    end

    def perform_rolls
      @rolls  = Array.new(num_rolls).map { roll }.tap do |rolls|
        @result = rolls.inject(:+) + modifier
      end
    end

    def roll
      @generator ||= Random.new
      @generator.rand(sides) + 1
    end
  end
end