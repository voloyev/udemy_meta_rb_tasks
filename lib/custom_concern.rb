module Custom
  module Concern
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def in_class(&block)
        @included_block = block
      end

      def class_methods(&block)
        @class_methods_block = block
      end

      def included(base)
        base.class_eval(&@included_block)

        const_set(:ClassMethods, Module.new)
        const_get(:ClassMethods).module_eval(&@class_methods_block)
        base.extend(const_get(:ClassMethods))
      end
    end
  end
end

module MyModule
  include Custom::Concern

  def instance_method
    'instance_method'
  end

  in_class do
    attr_accessor :foo
  end

  class_methods do
    def class_method
      'class method'
    end
  end
end

class MyyClass
  include MyModule
end

#p MyyClass.new.instance_metho
#p MyyClass.instance_methods(false
#p MyyClass.class_method
