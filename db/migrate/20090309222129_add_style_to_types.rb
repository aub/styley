class AddStyleToTypes < ActiveRecord::Migration
  def self.up
    add_column :types, :style_id, :integer
    add_column :types, :style_type, :string

    Type.all.each { |t| (t.send(:build_style); t.save) if t.style.nil? }
  end

  def self.down
    remove_column :types, :style_id
    remove_column :types, :style_type
  end
end
