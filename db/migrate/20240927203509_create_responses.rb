class CreateResponses < ActiveRecord::Migration[8.0]
  def change
    create_table :responses do |t|
      t.belongs_to :message, null: false, foreign_key: true
      t.string :content

      t.timestamps
    end
  end
end
