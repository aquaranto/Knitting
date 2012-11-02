require 'minitest_helper'
require './row'

describe Row do
  before do 
    @row_number = 2
    @odd_number = 1
    @stitch_args = ['k3', 'p2', 'k2', 'p2', 'k3']
    @row = Row.new_from_stitches(@row_number, @stitch_args)
    @odd_row = Row.new_from_stitches(@odd_number, @stitch_args)
    @visual_row = Row.new_from_visual(@row_number, "VVV--V--VVV")
    
  end

  it "must have consistent api" do
    Row.must_respond_to(:new_from_visual)
    Row.must_respond_to(:new_from_stitches)
    @row.must_respond_to(:parsed_string)
    @row.must_respond_to(:unparsed_pattern)
    @row.must_respond_to(:stitches)
    @row.must_respond_to(:row_number)
    @row.must_respond_to(:even?)
    @row.must_respond_to(:casted_on)
  end

  it "must return a valid row number" do
    @row.row_number.must_equal(@row_number)
  end

  it "must know if it's even" do
    @row.even?.must_equal(true)
  end

  it "must know if it's odd" do
    @odd_row.even?.must_equal(false)
  end

  it "must take the stitch args and parse into cast_on objects" do
    @row.stitches[0].must_be_instance_of CastOn
  end

  it "must calculate the number of stitches to cast on" do
    @visual_row.casted_on.must_equal 11
  end
end