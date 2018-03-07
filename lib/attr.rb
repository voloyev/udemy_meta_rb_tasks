module Kernel
  def attr_accessible(*args)
    args.each do |name|
      define_method(name) { instance_variable_get("@#{name}") }

      define_method("#{name}=") do |new_value|
        instance_variable_set("@#{name}", new_value)
      end
    end
  end

  private :attr_accessible
end
