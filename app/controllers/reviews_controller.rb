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

    def update
        review = find_review
        review.update(review_params)
        render json: review
    end

    def destroy
        review = find_review
        review.destroy
        render json: review
    end

    private 

    def find_review
        Review.find(params[:id])
    end

    def review_params
        params.require(:review).permit(:comment, :rating)
    end

    def data_notvalid(invalid)
        render json: {error: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end

end
