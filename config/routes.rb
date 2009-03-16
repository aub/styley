ActionController::Routing::Routes.draw do |map|
  map.resources :layers, :collection => { :sort => :put } do |layers|
    layers.resources :types do |types|
      types.resources :styles do |styles|
        styles.resources :images, :member => { :reset => :put }
      end
    end
  end
  map.resource :map, :controller => 'map'
  map.resource :preview_image, :controller => 'preview_image'
end
