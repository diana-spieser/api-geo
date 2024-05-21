class CreateUsers < ActiveRecord::Migration[7.0]
def change
    create_table :users do |t|
      t.string :nom
      t.string :prenom
      t.string :nom_jeune_fille
      t.string :lieu_naissance
      t.string :pays_naissance
      t.string :code_postal
      t.string :email

      t.timestamps
    end
    add_index :users, :email, unique: true
end
end
