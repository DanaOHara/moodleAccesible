Rails.application.routes.draw do
  devise_for :mdl_users
  resources :mdl_resources
  resources :mdl_contexts
  resources :mdl_role_assignments
  root 'welcome#index'

  resources :mdl_events
  resources :mdl_forum_posts
  resources :mdl_forum_discussions
  resources :mdl_forums
  resources :mdl_courses
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :mdl_users

get 'mdl_events/eventosPorCurso/:courseid', to: 'mdl_events#eventosPorCurso'
get 'mdl_users/', to: 'mdl_users#index'
get 'mdl_users/loginBase', to: 'mdl_users#loginBase'

get 'mdl_users/loginBaseFuncion/', to: 'mdl_users#loginBaseFuncion'
  get 'mdl_forums/obtenerForosPorCurso/:course', to: 'mdl_forums#obtenerForosPorCurso'
  get 'mdl_forum_discussions/obtenerDiscusionesPorForo/:forum', to: 'mdl_forum_discussions#obtenerDiscusionesPorForo'
  get 'mdl_forums_posts/obtenerPostPorDiscusionPrincipal/:discussion', to: 'mdl_forum_posts#obtenerPostPorDiscusionPrincipal'
  get 'mdl_forums_posts/oobetenerCursosPorIdUsuariobtenerPostRespuestas/:discussion/', to: 'mdl_forum_posts#obtenerPostRespuestas'
  get 'mdl_resources/obtenerRecursosPorCurso/:course', to: 'mdl_resources#obtenerRecursosPorCurso'
  get 'mdl_contexts/obetenerCursosPorIdUsuario/:userid', to: 'mdl_contexts#obetenerCursosPorIdUsuario'
  post 'mdl_users/loginProvisional', to: 'mdl_users#loginProvisional'

end
