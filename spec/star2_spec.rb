require 'rspec'
require 'spec_helper'
require_relative './../star2.rb'

RSpec.describe Star2 do
  subject(:call) { Star2.call('./spec/2.txt') }

  it 'runs the code' do
    call
  end

  it 'generates the number' do
    expect(call).to eq(2)
  end
end
