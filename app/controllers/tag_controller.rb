class TagController < ApplicationController
  def by_name
    @tag_name = params[:tag_name]
    @images = Image.tagged_with(@tag_name)
  end
end
