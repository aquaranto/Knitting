require 'minitest_helper'
require './cast_on'

describe CastOn do
  before do
    @cast_on_knit = CastOn.new(:knit, 3)
    @cast_on_purl = CastOn.new(:purl, 5)
    @stitches_from_visual = ['VVV', '---', 'VVV']
  end

  it "must have consistent api" do
    @cast_on_knit.must_respond_to(:type)
    @cast_on_knit.must_respond_to(:stitch_count) 
    @cast_on_knit.must_respond_to(:stitch_create)
  end

  it "must calculate row length" do
    CastOn.number_to_cast_on(@stitches_from_visual).must_equal 9
  end

  it "must convert from (:knit, 3) to visual string" do
    @cast_on_knit.stitch_create.must_equal "VVV"
  end

  it "must convert from (:purl, 5) to visual string" do
    @cast_on_purl.stitch_create.must_equal '-----'
  end


end