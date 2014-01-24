class AddDeletedAtOnBook < ActiveRecord::Migration
  def change
    add_column :books, :deleted_at, :timestamp
  end
end
