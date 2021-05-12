class CreateStudies < ActiveRecord::Migration[6.0]
  def change
    create_table :studies do |t|
      t.references :user,        null: false, foreign_key: true
      t.references :curriculum,  null: false, foreign_key: true
      t.timestamps
    end
  end
end
