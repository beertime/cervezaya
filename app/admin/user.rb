ActiveAdmin.register User do
  permit_params :username, :email, :password, :password_confirmation, :active, :admin, :publicname, :firstname, :lastname, :avatar, :gender, :country, :city, :birth

  index do
    selectable_column
    id_column
    column :username
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs "Usuario" do
      f.input :username
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :active
      f.input :admin
    end
    f.inputs "Más datos de usuario" do
      f.input :publicname
      f.input :firstname
      f.input :lastname
      f.input :avatar
      f.input :gender
      f.input :country
      f.input :city
      f.input :birth
    end
    f.actions
  end

end
