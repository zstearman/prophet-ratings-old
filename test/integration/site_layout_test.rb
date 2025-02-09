require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:zach)
  end
  
  test "layout links" do
    log_in_as(@user)
    get root_path
    follow_redirect!
    assert_template 'static_pages/dashboard'
    assert_select "a[href=?]", root_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
    # Not functional while coming soon page is present
    # assert_select "a[href=?]", signup_path + "?plan_id=1"
    # assert_select "a[href=?]", signup_path + "?plan_id=2"    
    # assert_select "a[href=?]", plans_path
    get contact_path
    assert_select "title", full_title("Contact")
    get signup_path
    assert_select "title", full_title("Create Your Account")
  end
  
end
