class CreateProviders < ActiveRecord::Migration[6.0]
  def change
    create_table :providers do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.integer :age

      t.timestamps
    end
  end
end
