require File.join(File.dirname(__FILE__), '..', 'test_helper')

class LayersControllerTest < ActionController::TestCase
  should_route :get, '/layers', :action => :index
  should_route :get, '/layers/1/edit', :action => :edit, :id => 1
  should_route :put, '/layers/1', :action => :update, :id => 1
  should_route :get, '/layers/new', :action => :new
  should_route :post, '/layers', :action => :create
  should_route :put, '/layers/sort', :action => :sort
end
