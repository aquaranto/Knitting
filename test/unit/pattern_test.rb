require 'minitest_helper'
require './pattern'
require './row'
require './stitch'
require './cast_on'

describe Pattern do 
  before do
    @pattern = Pattern.new('test_banana_pattern')
    cast_on = CastOn.new
    
    #stitches can be any object that responds to stitch and count
    @stitches = []
    @stitches << cast_on.stitch(:knit, 3)
    @stitches << cast_on.stitch(:purl, 2)
    @stitches << cast_on.stitch(:knit, 4)
  end

  it "must have a capitalized name" do
    @pattern.name.wont_be_empty
    @pattern.name.must_equal @pattern.name.capitalize
  end

  it "must have a consistent api" do 
    @pattern.must_respond_to(:add_row)
  end

  it "must properly add a row" do
    @pattern.add_row @stitches
    @pattern.rows.wont_be_empty
  end
  
end
