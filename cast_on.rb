require './stitch'

class CastOn
  attr_reader :count, :type

  def initialize(type, count)
    @type = type
    @count = count
  end
  #creates count number of stitch objects
  #expand for other stitches
  def stitch_create(type)
    if type == :knit
      stitches << Knit.new
    elsif type == :purl
      stitches << Purl.new
    end
  end
end