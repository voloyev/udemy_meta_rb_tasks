# frozen_string_literal: true
class MyStruct
  def self.new(*props, &block)
    klass = Class.new do
      @props = props
      attr_accessor(*props)

      def initialize(*values)
        values.each_with_index do |value, index|
          send("#{self.class.props[index]}=", value)
        end
      end

      def [](key)
        send(key)
      end

      def []=(key, value)
        send("#{key}=", value)
      end

      def self.props
        @props
      end
    end

    klass.class_eval(&block) if block_given?
    klass
  end
end

Myyy = MyStruct.new(:id, 'name')
