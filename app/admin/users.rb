ActiveAdmin.register User do

  permit_params :email, :password, :password_confirmation, :name
  form partial: "form"

end
