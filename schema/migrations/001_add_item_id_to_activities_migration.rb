migration 1, :add_item_id_to_activities  do
  up do
    modify_table :activities do |t|
      t.add_column :item_id, Integer
    end
  end

  down do
  end
end
