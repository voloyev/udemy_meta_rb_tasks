locals = [:a, :b, :c]

MyClass = Class.new do
  locals.each do |var|
    define_singleton_method var do
      instance_variable_get :"@#{var}"
    end

    define_method((var.to_s + 'i').to_sym) do
      instance_variable_get :"@#{var}"
      instance_variable_set :"@#{var}", "#{var}"
    end

    define_method((var.to_s + 'i=').to_sym) do |param = nil|
      instance_variable_set :"@#{var}", param
    end
  end
end

# p 'singletons methods'
# p MyClass.methods(false)

# p 'instance methods'
# p MyClass.instance_methods(false)
