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
  filter :genre

  action_item :new_movie,only: :index do
    link_to "Automatically Movie Upload", "http://maropost:3000/admin/movies/new?view=automatic"
  end

 form :html => { :enctype => "multipart/form-data"} do |f|
    f.inputs do
      render "movies/form", {movies: movie,view: params[:view]}
    end

  end

end
