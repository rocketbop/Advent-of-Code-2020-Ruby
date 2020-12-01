class Star1
  def self.call(file_path)
    new(file_path).call
  end

  def initialize(file_path)
    @file_path = file_path
  end

  def call
    generate_pairs
      .detect { |pair| pair[0] + pair[1] == 2020 }
      .then { |pair| pair[0] * pair[1] }
  end

  attr_reader :file_path

  def read_numbers
    @read_numbers ||= File.readlines(file_path).map(&:strip).map(&:to_i).sort
  end

  def generate_pairs
    sums = []
    read_numbers.reduce({}) do |hash, number|
      sum_minus_element = 2020 - number

      if hash[sum_minus_element].nil? && read_numbers.include?(sum_minus_element)
        sums.push([number, sum_minus_element])
      end

      hash[sum_minus_element] = number
      hash
    end
    sums
  end
end
