class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.text :comment
      t.text :image
      t.references :user, null: false, foreign_kye: true
      t.references :group, null: false, foreign_kye: true
      t.timestamps
    end
  end
end
