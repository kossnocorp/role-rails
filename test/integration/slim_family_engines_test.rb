require 'helper'

class SlimFamilyEnginesTest < ActionDispatch::IntegrationTest

  context "skim engine" do
    should 'setup role attribute' do
      get("/assets/application.js")

      assert_match /<div role=\\"implicitly_defined\\">/, response.body
      assert_match /<div role=\\"explicitly_defined\\">/, response.body
    end
  end

  context 'slim engine' do
    should 'setup role attribute' do
      get "/"

      assert_tag  :tag => 'div', :attributes => { :role => 'implicitly_defined' }
      assert_tag  :tag => 'div', :attributes => { :role => 'explicitly_defined' }
      assert_tag  :tag => 'div', :attributes => { :role => 'foo bar' }
    end
  end

end