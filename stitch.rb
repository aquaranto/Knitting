class Stitch
  attr_reader :markers
  
  def initialize(markers = {})
    @markers = markers
  end

  def to_s(marker_type = :normal)
    @markers[marker_type]
  end
end

class Knit < Stitch
  def initialize
    super( { :normal => "V", :inverse => "-" } )
  end
end

class Purl < Stitch
  def initialize
    super( { :normal => "-", :inverse => "V" } )
  end
end