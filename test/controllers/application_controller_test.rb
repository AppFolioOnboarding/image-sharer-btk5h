require 'test_helper'

class ApplicationControllerTest < ActionDispatch::IntegrationTest
  test 'has a link to the image submission form' do
    get root_url
    assert_response :success
    assert_select 'a[href=?]', new_image_path
  end
end
