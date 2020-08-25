class ChangePostalCodeType < ActiveRecord::Migration[6.0]
  def change
    change_column :providers, :postal_code, :string
    change_column :customers, :postal_code, :string
  end
end
