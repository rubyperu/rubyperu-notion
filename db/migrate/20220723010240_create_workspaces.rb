class CreateWorkspaces < ActiveRecord::Migration[7.0]
  def change
    create_table :workspaces do |t|
      t.references :owner, null: false, foreign_key: { to_table: :users }
      t.string :title

      t.timestamps
    end
  end
end
