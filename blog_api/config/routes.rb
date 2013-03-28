TamingthemindmonkeyApi::Application.routes.draw do

  devise_for :admins, :controllers => { :sessions => "admins/sessions" }

  resources :posts, except: :edit
  match '/posts', :controller => 'posts', :action => 'index', :constraints => {:method => 'OPTIONS'}
end
