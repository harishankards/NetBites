class VisitorsController < ApplicationController
    def index
        @recipe = Recipe.new
        if params[:query].present?
            @recipes = Recipe.search(params[:query])
            # render :text => @recipes.to_yaml
        else
            @recipes = Recipe.all.reverse
        end
        @tags = Recipe.tag_counts_on(:ingredients)

    end
    def tag_cloud
        @tags = Recipe.tag_counts_on(:ingredients)
    end

    def autocomplete
        render json: Recipe.search(params[:query], autocomplete: true, limit: 10).map(&:name)
    end

end
