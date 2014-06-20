require 'dice/version'
require 'dice/parser'
require 'dice/resolver'

module Dice
  class Roll

    attr_reader :parser, :resolver

    def initialize(string)
      @parser   = Dice::Parser.new string
      @resolver = Dice::Resolver.new(*parser.signature)#.tap(&:perform_rolls)
    end

    def roll
      @rolled ||= resolver.perform_rolls
    end

    def display
      roll
      puts message
    end

    def message
      "You rolled #{resolver.rolls.inspect}".tap do |s|
        s << " #{parser.sign} #{parser.modifier.abs}" if parser.sign
      end + "\nTotal: #{resolver.result}"
    end
  end

  def self.roll(string)
    Dice::Roll.new(string).display
  end

end