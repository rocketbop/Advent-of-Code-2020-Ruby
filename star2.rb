class Star2
  def self.call(file_path)
    new(file_path).call
  end

  def initialize(file_path)
    @file_path = file_path
  end

  def call
    read_lines.reduce(0) do |acc, n|
      policy, char, password = n.split
      char = char.tr(":", "")
      min, max = policy.split("-").map(&:to_i)

      if password.chars.tally[char]&.between?(min, max)
        acc += 1
      end
      acc
    end
  end

  private

  attr_reader :file_path

  def read_lines
    @read_numbers ||= File.readlines(file_path).map(&:strip)
  end
end
