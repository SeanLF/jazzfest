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