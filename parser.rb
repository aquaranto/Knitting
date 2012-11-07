require "./pattern"

def pattern(name)
  @pattern = Pattern.new(name)
  @stitches = []
end

def cast_on(stitch_count)
  @stitch_count = stitch_count
end

def method_missing(meth, *args, &block)
  if meth.to_s.match(/k(\d+)/)
    @stitches << "k#{count}"
  elsif meth.to_s.match(/p(\d+)/)
    @stitches << "p#{count}"
  end
end

load "sample_dsl_program.kt"