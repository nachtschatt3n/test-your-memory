ActiveAdmin.register Question do

  permit_params :label, :image_id,
                answers_attributes: [:id, :label, :_destroy, :correct]
  
  index do
    column "Image" do |question|
      image_tag question.image.src.url(:thumb)
    end
    column "Image Name" do |question|
      "#{question.image.label}"
    end
    column :label
    actions
  end
              




  form do |f|
    f.inputs do
      f.input :image_id, as: :select, collection: Image.all
      f.input :label      
      f.has_many :answers do |a|
        a.input :label
        a.input :correct
      end
    end
    f.actions
  end
end
