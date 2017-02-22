class Setting < ApplicationRecord

  def real_value
    case value_type
    when 'string', 'text'        then value
    when 'integer'              then value.to_i
    when 'float'                then value.to_f
    when 'decimal'              then value.to_d
    when 'date'                 then Date.parse(value)
    when 'boolean'              then value_to_boolean(value)
    else value
    end
  end

  def field_type
    case value_type
    when 'string', 'text' then 'text_field'
    when 'integer', 'float', 'decimal' then 'number_field'
    when 'date' then 'date_field'
    when 'boolean' then 'check_box'
    end
  end

  def self.min_dates
    find_by_name('Minimum number of dates')
  end

  def self.min_num_choices
    find_by_name('Minimum number of choices')
  end

  def self.max_num_choices
    find_by_name('Maximum number of choices')
  end

  private

  # convert something to a boolean
  def value_to_boolean(value)
    if value.is_a?(String) && value.empty?
      nil
    else
      TRUE_VALUES.include?(value)
    end
  end
end
