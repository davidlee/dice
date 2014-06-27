require 'dice/version'
require 'dice/parser'
require 'dice/resolver'

module Dice
  class Roll

    attr_reader :parser, :resolver

    def initialize(string)
      @parser   = Dice::Parser.new string
      @resolver = Dice::Resolver.new(*parser.signature)
    end

    def roll
      @rolled ||= resolver.perform_rolls
    end

    def message
      roll
      message = [].tap do |msg|
        msg << "Rolls: #{resolver.rolls.inspect}".tap do |s|
          s << " #{parser.sign} #{parser.modifier.abs}" if parser.sign
        end
        msg << "Total: #{resolver.result}"
      end.join("\n")
    end
  end

  def self.roll(string)
    puts Dice::Roll.new(string).message
  rescue ArgumentError
    puts "usage: roll 3d6; roll 2d10+6"
  end

end