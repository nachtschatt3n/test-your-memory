ActiveAdmin.register Image do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :src, :label, :src_file_name, :src_content_type, :src_file_size, :src_updated_at
  
  index do
    column "Image" do |image|
      image_tag image.src.url(:thumb)
    end
    column :label
   actions
  end



  form do |f|
    f.inputs do
      f.input :src
      f.input :label
    end
    f.actions
  end

end
