class Row
  attr_accessor :stitches, :row_number, :unparsed_string, :unparsed_pattern

  def self.new_from_pattern(row_number, string)
    new_row = new(row_number)
    new_row.unparsed_string = string
    new_row.parse
    p new_row
  end

  def self.new_from_stitches(row_number, stitches)
    new_row = new(row_number)
    new_row.stitches = stitches
    new_row
  end

  def parse
    if unparsed_string
      parse_string
    elsif unparsed_pattern
      parse_pattern
    end
  end

  def initialize(row_number)
    @row_number = row_number.to_i
  end

  def even?
    @row_number % 2 == 0
  end

  private

  def parse_string
    scan(/((.)\2*)/).map(&:first)
  end

  def parse_pattern
  end
end