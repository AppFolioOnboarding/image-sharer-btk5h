require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  test 'does not show errors when first rendering the page' do
    get new_image_url
    assert_response :ok
    assert_select '#error_explanation', count: 0
  end

  test 'adds valid images' do
    image_src = 'http://example.com/foo.png'
    assert_difference 'Image.count', 1 do
      post images_url, params: { image: { url: image_src } }
    end
    assert_redirected_to Image.order(:created_at).last
    follow_redirect!
    assert_select 'img[src=?]', image_src
  end

  test 'does not add invalid images' do
    assert_no_changes 'Image.count' do
      post images_path, params: { image: { url: '' } }
    end
    assert_select '#error_explanation'
  end

  test 'image information is shown' do
    image_src = 'http://example.com/foo.png'
    tag = 'bar'
    image = Image.create!(url: image_src, tag_list: tag)

    get image_url(image)
    assert_response :ok

    assert_select 'img[src=?]', image_src
    assert_select '#tag-list' do
      assert_select 'li a[href=?]', tag_by_name_path(tag), tag
    end
  end
end
