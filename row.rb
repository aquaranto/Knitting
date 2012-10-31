#require 'cast_on'
class Row
  attr_accessor :stitches, :row_number, :parsed_string, :unparsed_pattern

  def self.new_from_visual(row_number, string)
    new_row = new(row_number)
    new_row.parsed_string = string.parse_string
    p new_row
  end

  def self.new_from_stitches(row_number, stitch_args)
    new_row = new(row_number)
    new_row.stitches = []
    stitch_args.each do |pair|
      if pair[0] == 'k'
        stitch_type = :knit
      elsif pair[0] == 'p'
        stitch_type = :purl
      end
      stitch_count = pair[1].to_i
      new_row.stitches << CastOn.new(stitch_type, stitch_count)
    end
    new_row
  end

  def parse
    if @unparsed_string
      parse_string
    elsif @unparsed_pattern
      parse_pattern
    end
  end

  def initialize(row_number)
    @row_number = row_number.to_i
  end

  def even?
    @row_number % 2 == 0
  end


  def parse_pattern
  end
end

class String
  def parse_string
    scan(/((.)\2*)/).map(&:first)
  end
end