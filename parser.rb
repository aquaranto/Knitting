require "./pattern"



#def method_missing(meth, *args, &block)
#  p meth 
#  p args
#end



class Parser
  def parse(filename)
    content = File.read File.expand_path("./#{filename}")
    eval(content)
    p @stitches
  end

  def pattern(name)
    @pattern = Pattern.new(name)
    @stitches = []
  end

  def cast_on(stitch_count)
    @stitch_count = stitch_count
  end

  def method_missing(meth, *args, &block)
    if meth.to_s.match(/k(\d+)/)
      @stitches << "k#{$1}"
    elsif meth.to_s.match(/p(\d+)/)
      @stitches << "p#{$1}"
    end
  end
end


Parser.new.parse "sample_dsl_program.kt"



