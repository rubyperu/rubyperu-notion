class AddPublicToDocuments < ActiveRecord::Migration[7.0]
  def change
    add_column :documents, :public, :boolean, default: true
  end
end
