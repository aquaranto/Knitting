require 'minitest_helper'
require './pattern'
require './row'
require './stitch'
require './cast_on'

describe Pattern do 
  before do
    @pattern = Pattern.new('test_banana_pattern')
    #stitches can be any object that responds to stitch and count
    @stitches_row_1 = ['k3', 'p2', 'k2', 'p2', 'k3']
    @stitches_row_2 = ['k2', 'p3', 'k2', 'p3', 'k2']
    @stitches_visual_row_1 = 'VVV--VV--VVV'
    @stitches_visual_row_2 = 'VV---VV---VV'
  end

  it "must have a capitalized name" do
    @pattern.name.wont_be_empty
    @pattern.name.must_equal @pattern.name.capitalize
  end

  it "must have a consistent api" do 
    @pattern.must_respond_to(:add_row)
  end

  it "must properly add a row" do
    @pattern.add_row :stitch, @stitches_row_1
    @pattern.rows.wont_be_empty
  end

  it "must properly add multiple rows" do
    @pattern.add_row :stitch, @stitches_row_1
    @pattern.add_row :stitch, @stitches_row_2
    #p @pattern.rows
    @pattern.rows.length.must_equal 2
  end
  
  it "must properly add a row from visual" do
    @pattern.add_row :visual, @stitches_visual_row_1
    @pattern.rows.wont_be_empty
  end

  it "must properly add multiple rows from visual" do
    @pattern.add_row :visual, @stitches_visual_row_1
    @pattern.add_row :visual, @stitches_visual_row_2
    #p @pattern.rows
    @pattern.rows.length.must_equal 2
  end
end
