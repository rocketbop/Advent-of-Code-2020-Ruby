class Star2b
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
      position1, position2 = policy.split("-").map(&:to_i).map { |num| num - 1}

      occurrences = 0
      occurrences += 1 if password.chars[position1] == char
      occurrences += 1 if password.chars[position2] == char
      if occurrences == 1
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
