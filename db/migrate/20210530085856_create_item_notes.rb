# frozen_string_literal: true

class CreateItemNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :item_notes do |t|
      t.references :author, foreign_key: { to_table: :users }
      t.text :note

      t.timestamps
    end
  end
end
