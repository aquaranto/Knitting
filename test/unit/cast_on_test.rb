require 'minitest_helper'
require './cast_on'

describe CastOn do
  before do
    @cast_on = CastOn.new
  end

  it "must have consistent api" do
    @cast_on.must_respond_to(:stitch)
    @cast_on.must_respond_to(:count) 
  end

  it "must create container of stitch objects count times" do
    @cast_on.stitch(:knit, 3).must_equal 'VVV'
    @cast_on.stitch(:purl, 5).must_equal '-----'
  end


end