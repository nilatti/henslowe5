class CreateTheaters < ActiveRecord::Migration[5.1]
  def change
    create_table :theaters do |t|
      t.string :name

      t.timestamps
    end
  end
end
