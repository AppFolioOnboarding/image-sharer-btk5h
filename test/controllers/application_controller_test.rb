require 'test_helper'

class ApplicationControllerTest < ActionDispatch::IntegrationTest
  test 'has a link to the image submission form' do
    get root_url
    assert_response :success
    assert_select 'a[href=?]', new_image_path
  end

  test 'displays newer images first' do
    Image.delete_all
    first_image = Image.create!(url: 'http://example.com/foo.png')
    second_image = Image.create!(url: 'http://example.com/bar.png')

    get root_url

    assert_select 'a[href=?]', image_path(first_image) do
      assert_select 'img[src=?]', first_image.url
    end
    assert_select 'a[href=?]', image_path(second_image) do
      assert_select 'img[src=?]', second_image.url
    end

    assert body.index(second_image.url) < body.index(first_image.url),
           'The most recent image should appear first'
  end
end
