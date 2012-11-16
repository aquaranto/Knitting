class Stitch
  attr_reader :markers
  
  #creates a new instance of Stitch that knows it's markers
  def initialize(markers = {})
    @markers = markers
  end

  #creates the markers based on the state (default normal)
  def to_s(marker_from, marker_state = :normal)
    @markers[marker_from][marker_state]
  end
end

class Knit < Stitch
  #creates a new instance of Knit and sets the markers values
  def initialize
    super( {:stitch => { :normal => "V", :inverse => "-" }, 
            :visual => { :normal => "k", :inverse => "p" }})
  end
end

class Purl < Stitch
  #creates a new instance of Purl and sets the marker values
  def initialize
    super( {:stitch => { :normal => "-", :inverse => "V" }, 
            :visual => { :normal => "p", :inverse => "k" }})
  end
end