class IdeasController < ApplicationController
  def index
    @ideas = current_user.ideas.all
  end

  def new
  end

  def show
    @idea = current_user.ideas.find(params[:id])
  end

  def create
    @idea = current_user.ideas.new(idea_params)
    if @idea.save
      redirect_to @idea
    else
      flash.now[:errors] = @idea.errors.full_messages
      render :new
    end
  end

  private

  def idea_params
    params.require(:idea).permit(:theory, :question)
  end
end
