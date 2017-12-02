Rails.application.routes.draw do
  resources :mdl_events
  resources :mdl_forum_posts
  resources :mdl_forum_discussions
  resources :mdl_forums
  resources :mdl_courses
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :mdl_users

end
