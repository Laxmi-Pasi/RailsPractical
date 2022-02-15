class Reversiblemigration < ActiveRecord::Migration[7.0]
    def up
      add_column :images, :img_size, :decimal
    end
  
    def down
      remove_column :images, :img_size
    end
end
