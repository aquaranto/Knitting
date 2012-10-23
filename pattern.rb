class Pattern
  attr_accessor :rows
  def initialize
    @rows = []
  end

  def add_row(stitch_args)
    @rows << Row.new_from_stitches( (@rows.length + 1) , stitch_args)
  end

end

