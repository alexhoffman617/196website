class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.text :bio
      t.string :email, :unique =>true
      t.boolean :admin, :default =>true
      t.boolean :promoted. :default => true

      t.timestamps
    end
  end
end
