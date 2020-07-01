require 'test_helper'

class TagControllerTest < ActionDispatch::IntegrationTest
  test 'shows images with the correct tags' do
    Image.delete_all
    good_image = Image.create!(url: 'https://example.com/foo.png', tag_list: 'good')
    bad_image1 = Image.create!(url: 'https://example.com/bar.png', tag_list: 'bad')
    bad_image2 = Image.create!(url: 'https://example.com/baz.png')

    get tag_by_name_path('good')

    assert_select 'img[src=?]', good_image.url
    assert_select 'img[src=?]', bad_image1.url, count: 0
    assert_select 'img[src=?]', bad_image2.url, count: 0
  end
end
