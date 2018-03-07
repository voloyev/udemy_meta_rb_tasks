class MyHtml
  def initialize(&block)
    @rendered_html = ''
    instance_eval(&block)
  end

  def method_missing(tag, *args, &block)
    if args[0].is_a?(Hash)
      properties = 'aa' #(args.shift.map { |prop| prop.join('=')}) * " "
    end

    @rendered_html << "<#{tag} #{properties}>"

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
h = MyHtml.new do
      h1 'Name', class: 'my'
end.render
