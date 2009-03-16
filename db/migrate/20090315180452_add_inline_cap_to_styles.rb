class AddInlineCapToStyles < ActiveRecord::Migration
  def self.up
    add_column :styles, :inline_cap, :integer
  end

  def self.down
    remove_column :styles, :inline_cap
  end
end
