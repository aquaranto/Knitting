require './stitch'

class CastOn
  attr_reader :count, :type
  
  def self.number_to_cast_on(stitches_from_visual)
    count = 0
    stitches_from_visual.each {|x| count += x.length}
    count
  end
  
  def initialize(type, count)
    @type = type
    @count = count
  end
  #creates count number of stitch objects
  #expand for other stitches
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