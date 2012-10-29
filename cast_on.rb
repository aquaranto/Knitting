require './stitch'

class CastOn
  attr_reader :count

  #creates count number of stitch objects
  def stitch(type, count)
    stitches = []
    count.times do
      if type == :knit
        stitches << Knit.new
      elsif type == :purl
        stitches << Purl.new
      else
        #expand for other stitches
      end
    end
    stitches.join
  end
end