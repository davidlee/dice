module Dice

  class Parser
    attr_reader :string, :cardinality, :sides, :modifier

    RX = /^(\d+)?[d|D](\d+)([\+\-]\d+)?$/i

    def initialize(string)
      @string = string
    end

    def signature
      parse! unless cardinality
      [cardinality, sides, modifier]
    end

    def valid?
      !!match
    end

    def sign
      [ nil,'+','-'][modifier <=> 0]
    end

    private

    def parse!
      if match
        @cardinality = match[1].to_i
        @sides       = match[2].to_i
        @modifier    = match[3].to_i
        self
      else
        raise ArgumentError, string
      end
    end

    def match
      @match ||= RX.match(string)
    end
  end

end