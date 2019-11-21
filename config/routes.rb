Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "flight_tables#index"
  # Routes for the Flight table resource:

  # CREATE
  get("/flight_tables/new", { :controller => "flight_tables", :action => "new_form" })
  post("/create_flight_table", { :controller => "flight_tables", :action => "create_row" })

  # READ
  get("/flight_tables", { :controller => "flight_tables", :action => "index" })
  get("/flight_tables/:id_to_display", { :controller => "flight_tables", :action => "show" })

  # UPDATE
  get("/flight_tables/:prefill_with_id/edit", { :controller => "flight_tables", :action => "edit_form" })
  post("/update_flight_table/:id_to_modify", { :controller => "flight_tables", :action => "update_row" })

  # DELETE
  get("/delete_flight_table/:id_to_remove", { :controller => "flight_tables", :action => "destroy_row" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
