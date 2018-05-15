class CreateProductions < ActiveRecord::Migration[5.1]
  def change
    create_table :productions do |t|
      t.references :theater, foreign_key: true
      t.references :play, foreign_key: true

      t.timestamps
    end
  end
end
