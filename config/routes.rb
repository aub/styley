ActionController::Routing::Routes.draw do |map|
  map.resources :layers, :collection => { :sort => :put }
  map.resource :map, :controller => 'map'
  map.resource :preview_image, :controller => 'preview_image'
  map.resources :types, :collection => { :sort => :put } do |types|
    types.resources :styles
  end
end
