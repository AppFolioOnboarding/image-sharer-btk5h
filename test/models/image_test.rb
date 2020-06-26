require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  def setup
    @image = Image.new(url: 'http://example.com/foo.png')
  end

  test 'valid image' do
    assert @image.valid?
  end

  test 'valid image with https link' do
    @image.url = 'https://example.com/foo.png'
    assert @image.valid?
  end

  test 'invalid when url is blank' do
    @image.url = ''
    refute @image.valid?
    assert_not_nil @image.errors[:url]
  end

  test 'invalid when url is nil' do
    @image.url = nil
    refute @image.valid?
    assert_not_nil @image.errors[:url]
  end

  test 'invalid when url is not a url' do
    @image.url = '???'
    refute @image.valid?
    assert_not_nil @image.errors[:url]
  end

  test 'invalid when url protocol is not http or https' do
    @image.url = 'ws://example.com/foo.png'
    refute @image.valid?
    assert_not_nil @image.errors[:url]
  end

  test 'has no tags by default' do
    assert_equal [], @image.tag_list
  end

  test 'newline delimited tags can be added' do
    @image.tag_list = <<-TAGS
      first tag
      second tag
    TAGS

    assert_equal ['first tag', 'second tag'], @image.tag_list
  end

  test 'tags are normalized to lowercase' do
    @image.tag_list = 'FOO'
    assert_equal ['foo'], @image.tag_list
  end
end
