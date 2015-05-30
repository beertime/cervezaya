ActiveAdmin.register Contact do
  permit_params :message, :user_id
end
