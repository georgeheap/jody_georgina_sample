class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.references :customer, foreign_key: true
      t.references :default_avatar
      t.float :weight_kg
      t.text :bio
      t.string :tagline

      t.timestamps
    end
  end
end
