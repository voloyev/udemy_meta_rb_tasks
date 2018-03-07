require 'spec_helper'

describe MyStruct do
  NewStruct = MyStruct.new(:id, 'name')

  before(:each) do
    @struct = NewStruct.new(1, 'Book')
  end

  #it { NewStruct.instance_methods(false).must_equal([:[], :[]=, :name, :id, :name=, :id=]) }
  it { @struct.must_respond_to(:id) }
  it { @struct.must_respond_to(:name) }
  it { @struct.id.must_equal(1) }
  it do
    @struct.name.must_equal('Book')
    @struct['name'] = 'Vook'
    @struct.name.must_equal('Vook')
  end

  it {@struct[:name].must_equal('Book')}
end

describe 'MyStruct with block' do
  NewStruct = MyStruct.new(:id, 'name') do
    def to_ss
      "<#{self.class} id:#{id} name: '#{naem}'"
    end
  end

  before(:each) do
    @struct = NewStruct.new(1, 'Book')
  end
  it { @struct.must_respond_to(:to_ss) }
end
