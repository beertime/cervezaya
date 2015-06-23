ActiveAdmin.register Size do

  permit_params :name, :icon, :volume, :published

  active_admin_import

  index do
    selectable_column
    id_column
    column :name
    column :icon
    column :volume
    column :published
    column :updated_at
    actions
  end

end
