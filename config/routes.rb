QuakismartBootstrap::Application.routes.draw do  
  get "errors/not_found"
  get "errors/server_error"
  root to: 'usgs#index'
  get 'usgs/jquery'
  get 'usgs/jqueryui'
  post 'usgs/search'
end
