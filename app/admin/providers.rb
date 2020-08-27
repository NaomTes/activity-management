ActiveAdmin.register Provider do
  permit_params :first_name,
                :email,
                :age,
                :last_name,
                :profile_description,
                :base_price,
                :postal_code,
                :city,
                :street,
                :country,
                :password,
                :password_confirmation

  form do |f|
    f.inputs "Details" do
      f.input :first_name
      f.input :last_name
      f.input :age
      f.input :profile_description
      f.input :base_price
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :street
      f.input :city
      f.input :postal_code
      f.input :country
    end
    actions
  end

  show do
    attributes_table do
      row :first_name
      row :last_name
      row :email
      row :age
      row :profile_description
      row :base_price
      row :street
      row :city
      row :postal_code
      row :country
    end
  end

  index do
    column :first_name
    column :last_name
    column :email
    column :age
    column :profile_description
    column :base_price do |user|
      number_to_currency user.base_price
    end
    column :street
    column :city
    column :postal_code
    column :country
    column "Created at", :created_at
    column "Updated at", :updated_at
    actions
  end

  filter :services
  filter :first_name
  filter :last_name
  filter :email
  filter :age
  filter :service_description
  filter :base_price
  filter :city
  filter :postal_code
  filter :country
  filter :created_at
  filter :updated_at
end
