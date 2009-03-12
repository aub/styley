ActionController::Routing::Routes.draw do |map|
  map.resource :map, :controller => 'map'
  map.resource :preview_image, :controller => 'preview_image'
  map.resources :types
end
