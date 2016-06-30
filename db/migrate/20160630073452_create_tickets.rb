class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|
      t.string :topic
      t.integer :effective
      t.integer :prepare
      t.integer :practice
      t.text :info
      t.text :other
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
