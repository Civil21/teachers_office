ActiveAdmin.register Student do

  action_item :import, except: :import do
    link_to t('import'), admin_students_import_path
  end

  controller do
    def import; end

    def import_file
      Imports::AddStudents.call(params[:file])
      redirect_to admin_students_import_path, notice: 'Students adds.'
    end
  end

  permit_params :name, :group_id

end
