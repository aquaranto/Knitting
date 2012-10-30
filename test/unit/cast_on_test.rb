require 'minitest_helper'
require './cast_on'

describe CastOn do
  before do
    @cast_on_knit = CastOn.new(:knit, 3)
    @cast_on_purl = CastOn.new(:purl, 5)
  end

  it "must have consistent api" do
    @cast_on_knit.must_respond_to(:type)
    @cast_on_knit.must_respond_to(:count) 
  end
end