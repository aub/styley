require File.join(File.dirname(__FILE__), '..', 'test_helper')

class TypesControllerTest < ActionController::TestCase
  should_route :get, '/types', :action => :index
  should_route :get, '/types/1/edit', :action => :edit, :id => 1
  should_route :put, '/types/1', :action => :update, :id => 1
  should_route :get, '/types/new', :action => :new
  should_route :post, '/types', :action => :create
  should_route :put, '/types/sort', :action => :sort, :controller => 'types'
end
