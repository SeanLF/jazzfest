# frozen_string_literal: true

# Module that plugs in with form helpers to convert form methods to class names
module GeneratorHelper
  def self.get_class_for_form_field(field_method)
    case field_method
    when 'check_box'
      'checkbox'
    when 'radio_button'
      'radio'
    when 'select'
      'select'
    when 'text_area'
      'textarea'
    else
      'input'
    end
  end
end
