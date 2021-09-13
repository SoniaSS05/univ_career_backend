class UsersController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :data_notvalid

    def index
        users = User.all
        render json: users
    end

    def create
        user = User.create!(user_params)
        render json: user
    end

    private 

    def user_params
        params.require(:user).permit(:username, :password_digest)
    end

    def data_notvalid(invalid)
        render json: {error: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end
end
