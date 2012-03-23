require 'helper'
 
class ApplicationControllerTest < ActionController::TestCase
  tests ApplicationController
  
  context 'slim engine' do
    should 'setup role attribute' do
      get :index
      
      assert_tag  :tag => 'div', 
                  :attributes => {
                      :role => 'implicitly_defined'
                  }
                  
      assert_tag  :tag => 'div', 
                  :attributes => {
                      :role => 'explicitly_defined'
                  }                  
    end    
  end
end