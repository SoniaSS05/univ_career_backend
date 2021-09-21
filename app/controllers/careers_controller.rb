class CareersController < ApplicationController
    def index
        careers = Career.all
        render json: careers
    end

    def create
        career = Career.create!(career_params)
        render json: career
    end

    def universities
        carname = find_career
        carnameuniv= University.includes(:careers).where(careers: {career_name: carname.career_name})
        render json: carnameuniv
    end

    private

    def career_params
        params.require(:career).permit(:career_name)
    end

    def find_career
        Career.find(params[:id])
    end

end
