#require 'cast_on'
class Row
  attr_accessor :stitches, :row_number, :parsed_string, :unparsed_pattern, :casted_on

  #creates a new row from represntation and parses it into an array for CastOn to parse
  def self.new_from_visual(row_number, string)
    new_row = new(row_number)
    new_row.parsed_string = string.parse_string
    new_row.casted_on = CastOn.number_to_cast_on(new_row.parsed_string)
    new_row.stitches = []
    stitch_args.each do |pair|
      if pair[0] == 'k'
        stitch_type = :knit
      elsif pair[0] == 'p'
        stitch_type = :purl
      end
      stitch_count = pair[1].to_i
      new_row.stitches << CastOn.new_from_visual(stitch_type, stitch_count)
    end
    new_row
  end

  #create a new row from stitches and creates a CastOn object with the correct stitch type
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

  #def parse
  #  if @unparsed_string
  #    parse_string
  #  elsif @unparsed_pattern
  #    parse_pattern
  #  end
  #end

  #creates a new instance of row which knows its row number
  def initialize(row_number)
    @row_number = row_number.to_i
  end

  #determines if the row is even or odd
  def even?
    @row_number % 2 == 0
  end
end


class String
  #scans the string to create an array from the visual pattern
  def parse_string
    scan(/((.)\2*)/).map(&:first)
  end
end