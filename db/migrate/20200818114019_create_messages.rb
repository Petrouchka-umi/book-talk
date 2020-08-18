class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :title, null: false
      t.string :name, null: false
      t.text :text, null: false
      t.references :user, forenign_key: true
      t.timestamps
    end
  end
end
