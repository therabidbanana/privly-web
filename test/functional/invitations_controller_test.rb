require 'test_helper'

class Users::InvitationsControllerTest < ActionController::TestCase
  
  include Devise::TestHelpers 
  
  setup do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end
  
  test "should create invitation" do
    assert_difference('User.count') do
      post :create, {:user => {:email => "newEmail@email.com"}}
      assert_redirected_to pages_about_path
      assert_equal "Thanks #{assigns(:user).email}! When we are ready for more users we will send you a message.", flash[:notice]
    end
  end
  
  test "should obscure that user account already exists" do
    assert_difference('Post.count', 0) do
      post :create, {:user => {:email => users(:one).email}}
      assert_redirected_to pages_about_path
      assert_equal "Thanks #{users(:one).email}! When we are ready for more users we will send you a message.", flash[:notice]
    end
  end
  
  test "should not create blank invitation" do
    assert_difference('Post.count', 0) do
      post :create, {:user => {:email => ""}}
      assert_response :success # It will render the form again with errors
    end
  end
  
end
