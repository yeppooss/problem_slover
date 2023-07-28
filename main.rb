
class Parser
  def initialize(file_name)
    @filename = file_name
  end

  attr_reader :filename, :problems

  def proceed
    read
    parse
  end

  private

  def read
    file = File.open(@filename)
    @problems = file.readlines.map(&:chomp)
    file.close
  end

  def parse
    @problems.each do |problem|
      split_problem = problem.split(' ')
      p valid(split_problem[0], split_problem[1].gsub(/:/, ''), split_problem[2])
    end
  end

  def valid(character, times, line)
    count = line.count(character)
    lower = times.split('-')[0].to_i
    higher = times.split('-')[1].to_i
    (count >= lower) && (count <= higher)
  end
end

parser = Parser.new('problems.txt')
parser.proceed
