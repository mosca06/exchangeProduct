module Validatable
  def self.included(base)
    base.class_variable_set(:@@validations, [])
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module ClassMethods
    def validates(attr, **options)
      validations = class_variable_get(:@@validations)
      
      options.each do |option|
        validation = { attr: attr, type: { option.first => option.last } }
        validations << validation
      end

      class_variable_set(:@@validations, validations)
    end
  end

  module InstanceMethods
    def valid?
      self.class.class_variable_get(:@@validations).all? do |validation|
        attr = validation[:attr]
        options = validation[:type]

        options.all? do |key, value|
          if respond_to?("validate_#{key}", true)
            send("validate_#{key}", attr, value)
          else
            true
          end
        end
      end
    end
  end

  private

  def validate_presence(attr, _value)
    !send(attr).nil? && !send(attr).to_s.empty?
  end

  def validate_min_length(attr, length)
    send(attr).to_s.length >= length
  end

  def validate_numeric(attr, _value)
    send(attr).is_a?(Numeric)
  end
end
