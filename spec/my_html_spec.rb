require 'spec_helper'

describe 'MyHtml helper' do
  it 'generate html' do
    html = MyHtml.new  { h2 'Header' }
    html.must_eq('<h2>Header</h2>')
  end
end
