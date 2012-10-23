require 'minitest_helper'
require './pattern'
require './row'
require './stitch'

describe Pattern do
  StitchComposite = Struct.new(:stitch,:count)
    
  before do
    @pattern = Pattern.new
    
    #stitches can be any object that responds to stitch and count
    @stitches = []
    @stitches << StitchComposite.new(Knit.new,3)
    @stitches << StitchComposite.new(Purl.new,2)
    @stitches << StitchComposite.new(Knit.new,4)
  end

  it "must have a consistent api" do 
    @pattern.must_respond_to(:add_row)
  end

  it "must properly add a row" do
    @pattern.add_row @stitches
    @pattern.rows.wont_be_empty
  end
  
end
