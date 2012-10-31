require 'minitest_helper'
require './row'

describe Row do
  before do 
    @row_number = 2
    @odd_number = 1
    @row = Row.new(@row_number)
    @odd_row = Row.new(@odd_number)
    @stitch_args = ['k3', 'p2', 'k2', 'p2', 'k3']
  end

  it "must have consistent api" do
    Row.must_respond_to(:new_from_visual)
    Row.must_respond_to(:new_from_stitches)
    @row.must_respond_to(:parsed_string)
    @row.must_respond_to(:unparsed_pattern)
    @row.must_respond_to(:parse)
    @row.must_respond_to(:stitches)
    @row.must_respond_to(:row_number)
    @row.must_respond_to(:even?)
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

  it "must parse a pattern row properly" do
    row = Row.new_from_visual(@row_number, "VVV--V--VVV")
  end

  it "must take the stitch args and parse into cast_on objects" do
    row = Row.new_from_stitches(@row_number, @stitch_args)
  end

  #it "must parse a string properly" do
  #  Row.new_from_string()
  #end
end