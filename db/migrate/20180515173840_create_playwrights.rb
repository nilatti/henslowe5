class CreatePlaywrights < ActiveRecord::Migration[5.1]
  def change
    create_table :playwrights do |t|
      t.string :first_name
      t.string :last_name
      t.date :birth_date
      t.date :death_date
      t.string :country_of_origin
      t.text :bio

      t.timestamps
    end
  end
end
