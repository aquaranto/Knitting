require './row'

class Pattern
  attr_reader :name
  attr_accessor :rows

  #creates a new instance of Pattern that has a capitalized name and an array of row objects
  def initialize(name)
    @rows = []
    @name = name.capitalize
  end

  # Add a new row.
  # 
  # stitch_args - An array of string stitches.
  #
  # Returns an array of rows.
  def add_row(stitch_args)
    if stitch_args.instance_of? Array
      @rows << Row.new_from_stitches((@rows.length + 1), stitch_args)
    else
      @rows << Row.new_from_visual((@rows.length + 1), stitch_args)
    end
  end

  def render
    rows.reverse.each(&:render)
    puts
  end
end

