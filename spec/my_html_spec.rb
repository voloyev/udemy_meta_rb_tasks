require 'spec_helper'

describe 'MyHtml helper' do
  it 'generate h2 tag' do
    html = MyHtml.new  { h2 'Header' }
    html.must_eq('<h2>Header</h2>')
  end

  it 'generate included list' do
    html = MyHtml.new do
      ul 'Name'
      li 'first'
    end

    html.must_eq('<ul>Name<li>first</li></ul>')
  end

  it 'generate tags with attributes' do
    html = MyHtml.new do
      h1 'Name', id: 'my', class: "class"
    end

    assert_equal("<h1 id='my' class='class'>Name</h1>", html.render)
  end
end
