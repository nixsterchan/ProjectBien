class BookmarksController < ApplicationController

    # check if logged in as this is only for users
    before_action :check_login

    def create 
        # find the review we are bookmarking          review id refers to bookmark we are talking about
        @review = Review.find(params[:review_id])

        # create new bookmark which is based on this review,
        @bookmark = @review.bookmarks.new
        @bookmark.user = @current_user

        @bookmark.save


        # redirect to review page
        redirect_to review_path(@review)
    end

    def destroy

        @review = Review.find(params[:review_id])

        # deletes everything that is there
        @review.bookmarks.where(user: @current_user).delete_all

        redirect_to review_path(@review)

    end




end
