# frozen_string_literal: true

require 'rails/generators/generated_attribute'
require 'helpers/generator_helper'

# Helper for resources
module ResourcesHelper
  def attributes(record)
    policy(record).permitted_attributes.map do |name|
      Rails::Generators::GeneratedAttribute.parse([name, record.column_for_attribute(name).type].join(':'))
    end
  end

  def get_class_for_form_field(*args)
    GeneratorHelper.get_class_for_form_field(args)
  end
end
