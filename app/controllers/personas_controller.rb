class PersonasController < ApplicationController
  def new
    @persona = Persona.new(
      name: Faker::Name.name,
      industry: Faker::Company.industry,
    )
  end

  def edit
    @persona = current_user.personas.find(params[:id])
  end

  def update
    @persona = current_user.personas.find(params[:id])
    if @persona.update(persona_params)
      redirect_to @persona
    else
      flash.now[:errors] = @persona.errors.full_messages
      render :edit
    end
  end

  def create
    @persona = current_user.personas.new(persona_params)
    if @persona.save
      redirect_to @persona
    else
      flash.now[:errors] = @persona.errors.full_messages
      render :new
    end
  end

  def show
    @persona = current_user.personas.find(params[:id])
  end

  private

  def persona_params
    params.require(:persona).permit(
      :name,
      :industry,
      :profile,
      :goals
    )
  end
end
