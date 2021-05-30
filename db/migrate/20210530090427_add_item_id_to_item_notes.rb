class AddItemIdToItemNotes < ActiveRecord::Migration[5.2]
  def change
    add_reference :item_notes, :item, foreign_key: true
  end
end
