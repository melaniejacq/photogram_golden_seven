Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  mount WebGit::Engine, at: "/rails/git"

# CREATE
get("/photos/new", { :controller => "pictures", :action => "new_form" })
get("/create_photo", { :controller => "pictures", :action => "create_row" })

# READ aka Show Details
get("/photos", { :controller => "pictures", :action => "index" })
get("/photos/:the_id", { :controller => "pictures", :action => "show" })

# UPDATE aka Edit
get("/photos/:the_id/edit", { :controller => "pictures", :action => "edit_form" })
get("/update_photo/:the_id", { :controller => "pictures", :action => "update_row" })

# DELETE aka Delete
get("/delete_photo/:the_id", { :controller => "pictures", :action => "destroy_row" })

end