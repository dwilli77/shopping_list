# frozen_string_literal: true

class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.references :creator, foreign_key: { to_table: :users }
      t.references :manager, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
