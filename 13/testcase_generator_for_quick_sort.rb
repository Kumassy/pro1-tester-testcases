require 'yaml'

class Generator
  def initialize
    @testcases = []
  end
  def generate_for(len, range)
    raise(ArgumentError, "Range is larger than maxinum number.") if len > range.count
    t = range.to_a.shuffle.first(len)

    add(t.join(' '), t.sort.join(' '))
  end

  def add(before, after)
    t = {}
    t['args'] = before
    t['expect'] = 'Before: ' + before + "\n" + 'After: ' + after + "\n"

    @testcases << t
  end

  def to_s
    [{
      'target' => 'c-01',
      'testcase' => @testcases
    }].to_yaml( :line_width => -1 )
    # @testcases.to_yaml( :line_width => -1 )
    # @testcases.to_yaml
  end
end


generator = Generator.new
(1..100).each do |t|
  10.times{
    generator.generate_for t, 1..1000
  }
end
(1..100).each do |t|
  10.times{
    generator.generate_for t, -1000..1000
  }
end
puts generator.to_s
