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
    @normal = "V" 
    @inverse = "-"
    @stitch = Knit.new
  end

  it "must know its normal marker" do
    @stitch.to_s(:normal).must_equal(@normal)
  end

  it "must know its inverse marker" do
    @stitch.to_s(:inverse).must_equal(@inverse)
  end
end

describe Purl do
  before do
    @normal = "-" 
    @inverse = "V"
    @stitch = Purl.new
  end

  it "must know its normal marker" do
    @stitch.to_s(:normal).must_equal(@normal)
  end

  it "must know its inverse marker" do
    @stitch.to_s(:inverse).must_equal(@inverse)
  end
end