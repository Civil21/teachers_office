ActiveAdmin.register Lesson do
  permit_params :name, :user_id, :group_id, :subject_id, :number, :event_at

  form partial: "form"
end
