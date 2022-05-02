ActiveAdmin.register Post do

  permit_params :name, :text, :image

  form do |f|
    f.inputs do
      f.input :name
      f.input :text, as: :text
      f.input :image, as: :file
    end
    f.actions
  end

end
