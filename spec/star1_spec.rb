require 'rspec'
require 'spec_helper'
require_relative './../star1.rb'

RSpec.describe Star1 do
  subject(:call) { Star1.call('./spec/1.txt') }

  it 'runs the code' do
    call
  end

  it 'generates the number' do
    expect(call).to eq(514579)
  end
end
