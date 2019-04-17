class IdeasController < ApplicationController
  def index
    @ideas = current_user.ideas.all
    @personas = current_user.personas.all
  end

  def new
    @idea = current_user.ideas.new
  end

  def edit
    @idea = current_user.ideas.find(params[:id])
  end

  def update
    @idea = current_user.ideas.find(params[:id])
    if @idea.update(idea_params)
      redirect_to @idea
    else
      flash.now[:errors] = @idea.errors.full_messages
      render :edit
    end
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
    params.require(:idea).permit(:theory, :question, :public, :competition)
  end
end
