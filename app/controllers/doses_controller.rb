class DosesController < ApplicationController
  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    # create cocktai, ingredient, dose
    @cocktail = Cocktail.find(params[:cocktail_id])
    @ingredient = Ingredient.find(params[:dose][:ingredient_id])
    @dose = Dose.new(dose_params)

    # associate cocktail & ingredient
    @dose.cocktail = @cocktail
    @dose.ingredient = @ingredient

    #save & redirect
    @dose.save
    redirect_to @cocktail
  end

  def destroy
    # console
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktails_path
  end

  def dose_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end

end
