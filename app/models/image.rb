class Image < ApplicationRecord
  validate :must_have_valid_url

  def must_have_valid_url
    errors.add(:url, 'must be a link to an image') unless valid_url?(url)
  end

  private

  def valid_url?(value)
    return false if value.nil?

    uri = URI.parse(value)
    uri.is_a?(URI::HTTP) && !uri.host.nil?
  end
end
