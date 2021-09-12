class UniversitiesController < ApplicationController

    def index
        universities = University.all
        render json: universities
    end

    def create
        university = University.create(university_params)
        render json: university
    end

    def show
        university = University.find(params[:id])
        render json: university
    end

    def update
        university = University.find(params[:id])
        university.update(university_params)
        render json: university
    end

    def destroy
        university = University.find(params[:id])
        university.destroy
        head :no_content
    end

    
    private

    def university_params
        params.require(:university).permit(:name, :location, :url)
    end
end
