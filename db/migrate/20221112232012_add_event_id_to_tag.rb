class AddEventIdToTag < ActiveRecord::Migration[6.0]
  def change
    add_reference :tags, :event, index: true, foreign_key: true
  end
end
