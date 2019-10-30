class AddFileAttachmentToleads < ActiveRecord::Migration[5.2]
  def change
    add_column :leads, :attachment_file, :longblob
  end
end
