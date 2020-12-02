require 'rspec'
require 'spec_helper'
require_relative './../star2b.rb'

RSpec.describe Star2b do
  subject(:call) { Star2b.call('./spec/2.txt') }

  it 'runs the code' do
    call
  end

  it 'generates the number' do
    expect(call).to eq(1)
  end
end
