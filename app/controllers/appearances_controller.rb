class AppearancesController < ApplicationController

  def index
    @appearances = Appearance.all
  end

  def new
    @appearance = Appearance.new
  end

  def create
    @appearance = Appearance.new(appearance_params)
    if @appearance.save
      redirect_to @appearance.episode
    else
      redirect_to new_appearance_path
    end
  end

  def show
    @appearance = Appearance.find(params[:id])
  end

  def edit
    @appearance = Appearance.find(params[:id])
  end

  ####### below works, now trying to add validation...
  # def update
  #   @appearance = Appearance.find(params[:id])
  #   @appearance.update(appearance_params)
  #   redirect_to appearance_path(@appearance)
  # end
######

  def update #update method including validation...
    @appearance = Appearance.find(params[:id])
    @appearance.update(appearance_params)
    if @appearance.valid?
     @appearance.save
     redirect_to appearance_path(@appearance)
    else
     render :appearance #show show page again... maybe i should have made an edit form page :(
    end #end if...else statement
  end

  private

  def appearance_params
    params.require(:appearance).permit(:guest_id, :episode_id, :rating)
  end

end
