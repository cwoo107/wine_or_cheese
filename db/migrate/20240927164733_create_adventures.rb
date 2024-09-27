class CreateAdventures < ActiveRecord::Migration[8.0]
  def change
    create_table :adventures do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.boolean :active

      t.timestamps
    end
  end
end
