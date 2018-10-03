class CommentsController < ApplicationController

    def create 
        # first we need to find the review we are talking about, so we find it by iD
        @review = Review.find(params[:review_id])

        # we got some data from the form we added, and we will add it here
        @comment = @review.comments.new(params.require(:comment).permit(:body))

        # save comment to database
        @comment.save

        # go back to the review show page for the particular review
        redirect_to review_path(@review)

    end

end
