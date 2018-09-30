module InstanceCounter
  def self.included(klass)
    klass.extend(ClassMethods)
    klass.send :include, InstanceMethods
    klass.class_variable_set(:@@instances, 0)
  end

  module ClassMethods
    def instances
      class_variable_get(:@@instances)
    end
  end

  module InstanceMethods
    protected
    def register_instance
      p self.class
      self.class.class_variable_set(:@@instances,
      (self.class.class_variable_get(:@@instances) + 1))
    end
  end
end
