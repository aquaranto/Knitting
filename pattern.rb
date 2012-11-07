class Pattern
  attr_reader :name
  attr_accessor :rows

  #creates a new instance of Pattern that has a capitalized name and an array of row objects
  def initialize(name)
    @rows = []
    @name = name.capitalize
  end

  #adds a new row object based on the class of the stitch args (stitches are held in an array, the visual representation is a string )
  def add_row(stitch_args)
    if stitch_args.instance_of? Array
      @rows << Row.new_from_stitches((@rows.length + 1), stitch_args)
    else
      @rows << Row.new_from_visual((@rows.length + 1), stitch_args)
    end
  end
end

