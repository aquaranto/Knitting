require 'minitest_helper'
require './stitch'

describe Stitch do
  before do
    @stitch = Stitch.new
  end

  it "must have consistent api" do
    @stitch.must_respond_to(:markers)
    @stitch.must_respond_to(:to_s) 
  end
end

describe Knit do
  before do
    @normal_stitch = "V" 
    @inverse_stitch = "-"
    @normal_visual = "k"
    @inverse_visual = "p" 
    @stitch = Knit.new
  end

  it "must know its normal stitch marker" do
    @stitch.to_s(:stitch, :normal).must_equal(@normal_stitch)
  end

  it "must know its inverse stitch marker" do
    @stitch.to_s(:stitch, :inverse).must_equal(@inverse_stitch)
  end
  
  it "must know its normal visual marker" do
    @stitch.to_s(:visual, :normal).must_equal(@normal_visual)
  end

  it "must know its inverse visual marker" do
    @stitch.to_s(:visual, :inverse).must_equal(@inverse_visual)
  end

end

describe Purl do
  before do
    @normal_stitch = "-" 
    @inverse_stitch = "V"
    @normal_visual = "p"
    @inverse_visual = "k" 
    @stitch = Purl.new
  end

  it "must know its normal stitch marker" do
    @stitch.to_s(:stitch, :normal).must_equal(@normal_stitch)
  end

  it "must know its inverse stitch marker" do
    @stitch.to_s(:stitch, :inverse).must_equal(@inverse_stitch)
  end

  it "must know its normal visual marker" do
    @stitch.to_s(:visual, :normal).must_equal(@normal_visual)
  end

  it "must know its inverse visual marker" do
    @stitch.to_s(:visual, :inverse).must_equal(@inverse_visual)
  end
end