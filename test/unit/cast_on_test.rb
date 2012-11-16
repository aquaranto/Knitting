require 'minitest_helper'
require './cast_on'

describe CastOn do
  before do
    @stitches_from_visual = ['VVV', '---', 'VVV']
  end

  it "must calculate row length" do
    CastOn.number_to_cast_on(@stitches_from_visual).must_equal 9
  end

  describe "knit" do
    before do
      @cast_on = CastOn.new(:knit, 3)
    end

    it "casts the correct size" do
      @cast_on.stitch_create.size.must_equal 3
    end

    it "casts the correct stitch" do
      @cast_on.stitch_create.all? {|s| s.instance_of?(Knit) }.must_equal true
    end
  end

  describe "purl" do
    before do
      @cast_on = CastOn.new(:purl, 5)
    end

    it "casts the correct size" do
      @cast_on.stitch_create.size.must_equal 5
    end

    it "casts the correct stitch" do
      @cast_on.stitch_create.all? {|s| s.instance_of?(Purl) }.must_equal true
    end
  end
end