class ReassignTypeStylesThroughStyleAttachments < ActiveRecord::Migration
  def self.up
    Type.all.each { |type| type.style_attachments.create(:style => type.style_type.constantize.find(type.style_id)) }
    remove_column :types, :style_type
    remove_column :types, :style_id
  end

  def self.down
    add_column :types, :style_id, :integer
    add_column :types, :style_type, :string
    # We can't really get it back because there are multiple styles, so I'm just going to rebuild them
    Style.all.each { |style| style.destroy }
    StyleAttachment.all.each { |style_attachment| style_attachment.destroy }
    Type.all.each { |type| type.send(:build_style) }
  end
end
