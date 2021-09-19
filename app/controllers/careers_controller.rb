class CareersController < ApplicationController
    def index
        careers = Career.all
        render json: careers
    end

    def create
        career = Career.create!(career_params)
        render json: career
    end

    private

    def career_params
        params.require(:career).permit(:career_name)
    end

end
