class CreateMembreTable < ActiveRecord::Migration
  def up
    create_table :membres do |t|
      t.string :nom
      t.string :prenom
    end
  end

  def down
    drop_table :membres
  end
end
