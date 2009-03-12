require File.join(File.dirname(__FILE__), '..', 'test_helper')

class MapControllerTest < ActionController::TestCase
  should_route :get, 'map', :action => :show, :controller => 'map'
  should_route :get, 'map.xml', :action => :show, :format => 'xml', :controller => 'map'
  should_route :get, 'map/edit', :action => :edit, :controller => 'map'
  should_route :put, 'map', :action => :update, :controller => 'map'
end
