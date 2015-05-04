ActiveAdmin.register Promotion do

  permit_params :title, :description, :image, :start_date, :end_date, :start_hour, :end_hour, :recurrent, :monday, :tuesday, :wednesday, :thurdsay, :friday, :saturday, :sunday

end
