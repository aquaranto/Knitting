class Stitch
  attr_reader :markers
  
  #creates a new instance of Stitch that knows it's markers
  def initialize(markers = {})
    @markers = markers
  end

  #creates the markers based on the state (default normal)
  def to_s(marker_state = :normal)
    @markers[marker_state]
  end
end

class Knit < Stitch
  #creates a new instance of Knit and sets the markers values
  def initialize
    super( { :normal => "V", :inverse => "-" } )
  end
end

class Purl < Stitch
  #creates a new instance of Purl and sets the marker values
  def initialize
    super( { :normal => "-", :inverse => "V" } )
  end
end