class Star1b
  def self.call(file_path)
    new(file_path).call
  end

  def initialize(file_path)
    @file_path = file_path
  end

  def call
    generate_triplets
      .detect { |triplet| triplet[0] + triplet[1] + triplet[2] == 2020 }
      .then { |triplet| triplet[0] * triplet[1] * triplet[2] }
  end

  attr_reader :file_path

  def read_numbers
    @read_numbers ||= File.readlines(file_path).map(&:strip).map(&:to_i).sort
  end

  def generate_triplets
    sums = []
    read_numbers.each do |number2|
      read_numbers.reduce({}) do |hash, number|
        sum_minus_element = 2020 - (number + number2)

        if hash[sum_minus_element].nil? && read_numbers.include?(sum_minus_element)
          sums.push([number, number2, sum_minus_element])
        end

        hash[sum_minus_element] = number
        hash
      end
    end
    sums
  end
end
