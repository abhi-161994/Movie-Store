ActiveAdmin.register Movie do
  permit_params :title,:image,:genre,:plot,:rating,:web,:year,:cast
 decorate_with MovieDecorator
  index do
    selectable_column
    id_column
    column :title
    column :image
    column :genre
    column :plot
    column :rating
    column :web
    column :year
    column :cast
    actions
  end

  filter :title


  form do |f|
    f.inputs do
      f.input :title
      f.input :image
      f.input :genre
    end
    f.actions
  end

end
