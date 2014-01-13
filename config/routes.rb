QuakismartBootstrap::Application.routes.draw do
  root to: 'usgs#index'
  get 'usgs/jquery'
  get 'usgs/jqueryui'
end
