class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'cocktails/show'
    end
  end

  def destroy
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.find(params[:id])
    @dose.delete
    redirect_to cocktail_path(@cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
