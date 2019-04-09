class StaticPagesController < ApplicationController
  skip_before_action :require_login!

  def root
    @ideas = Idea.where(public: true)
  end
end
