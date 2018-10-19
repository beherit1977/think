module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_accessor :validations

    def validate(name, type, args = nil)
      @validations ||= []
      @validations << { attr_name: name, valid_type: type, args: args }
    end
  end

  module InstanceMethods
    def validate!
      self.class.validations.each do |validation|
        validation_attr = instance_variable_get("@#{validation[:attr_name]}")
        send(validation[:valid_type].to_sym, validation_attr, validation[:args])
      end
    end

    def valid?
      validate!
      true
    rescue StandardError
      false
    end

    protected

    def presence(validation_attr, args)
      raise 'Значение атрибута не может быть nil или пустым' if validation_attr.nil? ||
                                                                validation_attr.to_s == ''
    end

    def format(validation_attr, regex)
      raise 'Атрибут не соответствует регулярному выражению' unless validation_attr =~ regex
    end

    def type(validation_attr, class_name)
      raise 'Атрибут не соответствует заданному классу' unless validation_attr.is_a?(class_name)
    end
  end
end
