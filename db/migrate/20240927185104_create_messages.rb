class CreateMessages < ActiveRecord::Migration[8.0]
  def change
    create_table :messages do |t|
      t.belongs_to :adventure, null: false, foreign_key: true
      t.text :message

      t.timestamps
    end
  end
end
