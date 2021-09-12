class UniversitiesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_notfound
    rescue_from ActiveRecord::RecordInvalid, with: :data_notvalid

    def index
        universities = University.all
        render json: universities
    end

    def create
        university = University.create!(university_params)
        render json: university
    end

    def show
        university = find_university
        render json: university
    end

    def update
        university = find_university
        university.update(university_params)
        render json: university
    end

    def destroy
        university = find_university
        university.destroy
        head :no_content
    end

    
    private

    def find_university
        University.find(params[:id])
    end

    def university_params
        params.require(:university).permit(:name, :location, :url)
    end

    def record_notfound
        render json: {error: "University not found"}, status: :not_found
    end

    def data_notvalid(invalid)
        render json: {error: invalid.record.errors.full_messages}, status: :unprocessable_entity

    end
end
