class ReviewsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :data_notvalid

    def index
        reviews = Review.all
        render json: reviews
    end

    def create
        review = Review.create!(review_params)
        render json: review
    end


    private 

    def review_params
        params.require(:review).permit(:comment, :rating, :university_id, :user_id)
    end

    def data_notvalid(invalid)
        render json: {error: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end

end
