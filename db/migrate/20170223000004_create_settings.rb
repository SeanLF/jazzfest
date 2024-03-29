# frozen_string_literal: true

class CreateSettings < ActiveRecord::Migration[6.1]
  def change
    create_table(:settings) do |t|
      t.string(:name)
      t.string(:value_type)
      t.string(:value)

      t.timestamps
    end
  end
end
