class Pattern
  attr_reader :name
  attr_accessor :rows

  def initialize(name)
    @rows = []
    @name = name.capitalize
  end

  def add_row(stitch_args)
    @rows << Row.new_from_stitches((@rows.length + 1), stitch_args)
  end

  def add_visual_row(stitch_args)
    @rows << Row.new_from_visual((@rows.length + 1), stitch_args)
  end
end

