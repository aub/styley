require File.join(File.dirname(__FILE__), '..', 'test_helper')

class PreviewImageControllerTest < ActionController::TestCase
  should_route :get, 'preview_image', :action => :show, :controller => 'preview_image'
end
