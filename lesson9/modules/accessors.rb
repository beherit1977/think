module Accessors
  def attr_accessor_with_history(*names)
    names.each do |name|
      attr_name = "@#{name}"
      attr_history = "@#{name}_history"

      define_method(name) { instance_variable_get(attr_name) }
      define_method("#{name}_history") { instance_variable_get(attr_history) }

      define_method("#{name}=") do |value|
        instance_variable_set(attr_history, []) if instance_variable_get(attr_history).nil?

        instance_variable_set(attr_name, value)
        instance_variable_get(attr_history) << instance_variable_get(attr_name)
      end
    end
  end

  def strong_attr_accessor(name, class_name)
    attr_name = "@#{name}"

    define_method(name) { instance_variable_get(attr_name) }

    define_method("#{name}=") do |value|
      instance_variable_set(attr_name, value)

      raise 'wrong argument type' unless value.is_a?(class_name)

      instance_variable_set(attr_name, value)
    end
  end
end
