require 'spec_helper'

describe TestClassTap do
  before do
    @test = TestClassTap.new
  end

  it 'instance should respond to tap method' do
    assert_equal(true, @test.respond_to?(:class_tap))
  end
end
