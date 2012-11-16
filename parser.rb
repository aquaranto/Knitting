require "./pattern"

module Parser
  class Stitches
    attr_accessor :stitches, :patterns
    def self.parse(filename)
      content = File.read(File.expand_path("./#{filename}"))
      parser = new
      parser.instance_eval(content)
      parser
    end

    def initialize
      @patterns = []
    end

    def pattern(name)
      @patterns << @pattern = Pattern.new(name)
    end

    def row(number, *args)
      @pattern.add_row(:stitch, args)
    end

    def cast_on(stitch_count)
      @stitch_count = stitch_count
    end

    def repeat(rows_to_repeat, times_to_repeat)
    end

    def method_missing(meth, *args, &block)
      if meth.to_s.match(/k(\d+)/)
        "k#{$1}"
      elsif meth.to_s.match(/p(\d+)/)
        "p#{$1}"
      else
        super
      end
    end
  end

  class Visual
    attr_accessor :stitches, :patterns, :pattern_name
    def self.parse(filename)
      @stitches = []
      File.open(filename).each do |line|
        line.chomp!
        @stitches << line
      end     
      @stitches.reverse!
      p @stitches
      @pattern_name = @stitches.pop
      parser = new
      pattern(@pattern_name)
      parser
    end

    def initialize
      @patterns = []
    end

    def pattern(name)
      @patterns << Pattern.new(name)
    end
  end
end  

knitter = Parser::Stitches.parse "sample_dsl_program.kt"
knitter.patterns.each do |pattern|
  p pattern.name
  pattern.render_stitches
end 

purler = Parser::Visual.parse "sample_visual_program.kt"
  purler.patterns.each do |pattern|
    p purler.pattern_name
    pattern.render_visual
  end


