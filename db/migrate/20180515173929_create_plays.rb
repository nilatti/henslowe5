class CreatePlays < ActiveRecord::Migration[5.1]
  def change
    create_table :plays do |t|
      t.references :playwright, foreign_key: true
      t.string :title
      t.date :year
      t.text :summary

      t.timestamps
    end
  end
end
