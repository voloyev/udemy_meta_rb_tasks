require 'spec_helper'

describe MyyClass do

  before do
    @myy_inst  = MyyClass.new
    @myy       = MyyClass
  end

  it 'should respond to instance_method' do
    assert_equal('instance_method', @myy_inst.instance_method)
  end

  it 'should have instance methods' do
    assert_equal(%i[foo foo=], @myy.instance_methods(false))
  end

  it 'should have class_method' do
    assert_equal('class method', @myy.class_method)
  end
end
