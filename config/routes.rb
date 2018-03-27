Rails.application.routes.draw do

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

  get 'mdl_forums/obtenerForosPorCurso/:course', to: 'mdl_forums#obtenerForosPorCurso'
  get 'mdl_forum_discussions/obtenerDiscusionesPorForo/:forum', to: 'mdl_forum_discussions#obtenerDiscusionesPorForo'
  get 'mdl_forums_posts/obtenerPostPorDiscusionPrincipal/:discussion', to: 'mdl_forum_posts#obtenerPostPorDiscusionPrincipal'
  get 'mdl_forums_posts/obtenerPostRespuestas/:discussion/', to: 'mdl_forum_posts#obtenerPostRespuestas'
  get 'mdl_resources/obtenerRecursosPorCurso/:course', to: 'mdl_resources#obtenerRecursosPorCurso'

  post 'mdl_contexts/misCursos/', to: 'mdl_contexts#misCursos'

  post 'mdl_users/verifEmail', to: 'mdl_users#verifEmail'
  get 'mdl_users/emailErroneo', to: 'mdl_users#emailErroneo'
  get 'mdl_users/vcontrasena/:contrasena', to: 'mdl_users#vcontrasena'
  get 'mdl_contexts/curso/:userid', to: 'mdl_contexts#curso'
  get 'mdl_contexts/course/:id', to: 'mdl_contexts#course'
  get 'mdl_context/buscar', to: 'mdl_context#buscar'


end
