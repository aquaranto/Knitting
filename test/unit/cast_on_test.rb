require 'minitest_helper'
require './cast_on'

describe CastOn do
  before do
    @cast_on = CastOn.new
  end

  it "must have consistent api" do
    @cast_on.must_respond_to(:stitches)
    @cast_on.must_respond_to(:count) 
  end


end