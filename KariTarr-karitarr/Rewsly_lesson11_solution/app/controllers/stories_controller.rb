class StoriesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @stories = Story.search_for(params[:q])
  end

  def show
    @story = Story.find params[:id]
  end

  def new
    @story = Story.new
  end

  def create
    @story = Story.new story_params.merge(upvotes: 1)

    if @story.save
      redirect_to @story
    else
      render :new
    end
  end

  private
  def story_params
    params.require(:story).permit(:title, :link, :category)
  end
end
