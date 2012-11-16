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
  def add_row(type, stitch_args)
    if type == :stitch
      @rows << Row.new_from_stitches((@rows.length + 1), stitch_args)
    elsif type == :visual
      @rows << Row.new_from_visual((@rows.length + 1), stitch_args)
    end
  end

  def render_stitches
    rows.reverse.each(&:render_stitches)
    puts
  end

  def render_visual
    rows.each(&:render_visual)
    puts
  end
end

