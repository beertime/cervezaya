ActiveAdmin.register Promotion do

  index do
    selectable_column
    id_column
    column :title
    column :start_date
    column :end_date
    column(:start_hour) do |resource|
      resource.start_hour.strftime('%H:%M')
    end
    column(:end_hour) do |resource|
      resource.end_hour.strftime('%H:%M')
    end
    column :recurrent
    column :published
    actions
  end

  permit_params :title, :description, :image, :start_date, :end_date, :start_hour, :end_hour, :recurrent, :monday, :tuesday, :wednesday, :thurdsay, :friday, :saturday, :sunday, :published, :bar_id

end
