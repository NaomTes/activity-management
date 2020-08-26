ActiveAdmin.register Service do
  permit_params :name

  filter :providers
  filter :name
end
