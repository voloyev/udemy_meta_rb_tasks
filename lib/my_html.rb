class MyHtml
  def initialize(&block)
    @rendered_html = ''
    instance_eval(&block)
  end

  def method_missing(tag, *args, &block)
    @rendered_html << "<#{tag}>"

    if block_given?
      instance_eval(&block)
    else
      @rendered_html << "#{args.first}"
    end

    @rendered_html << "</#{tag}>"
  end

  def render
    @rendered_html
  end
end

# html = MyHtml.new do
#   h2 'Header'
#   code 'Some code'

#   ul do
#     li 'first in list'
#     li 'second in list'
#     li 'third in list'
#   end
# end

# puts html.render
