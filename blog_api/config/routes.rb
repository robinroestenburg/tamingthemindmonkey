TamingthemindmonkeyApi::Application.routes.draw do

  #mount Blog.new, :at => '/'
  #mount BlogAdmin.new, :at => '/adminbackend'

  devise_for :admins, :controllers => { :sessions => "admins/sessions" }

  resources :posts, except: :edit

end
