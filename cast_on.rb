require './stitch'

class CastOn
  attr_reader :stitch_count, :type
  
  #determines the number of stitches to cast on using the visual reprensentations
  def self.number_to_cast_on(stitches_from_visual)
    count = 0
    stitches_from_visual.each {|x| count += x.length}
    count
  end
  
  #creates a new instance of CastOn which knows its type and count
  def initialize(type, stitch_count)
    @type = type
    @stitch_count = stitch_count
  end

  #creates count number of stitch objects and joins them (expand for other stitches)
  def stitch_create
    stitches = []
    @count.times do
      if @type == :knit
        stitches << Knit.new
      elsif @type == :purl
        stitches << Purl.new
      end
    end
    stitches.join
  end
end