# frozen_string_literal: true

# serves static content
class HomeController < ApplicationController
  def index
    @recent_posts = Post.last(5)
    @links = Link.all
  end

  def about; end

  def paintings; end
end
