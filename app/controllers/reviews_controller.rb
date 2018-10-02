

class ReviewsController < ApplicationController


    def index 
        # list page for reviews function

        # <% %> is a ruby functionality that allows us to put in the variable defined here into the html.erb file
        # very first touch on dynamic coding in ruby so its very important to remember 
        @number = rand(100) 

        # show items in database
        @reviews = Review.all

    end


    def new 
        # new review 
        # we will be making a model here, by taking our controller and making a new mode, then giving it to our html to make a form
        @review = Review.new
    end

    def create
        # takes info from the form and add to the database
        # create new row in database and save
        @review = Review.new(params.require(:review).permit(:title, :body, :score)) 

        # save to database
        @review.save

        # redirect back to homepage
        redirect_to root_path
    end

    def show
        # individual review page
        @review = Review.find(params[:id])
    end

    def destroy
        # find the individual review
        @review = Review.find(params[:id])

        # destroy review
        @review.destroy

        # redirect to homepage
        redirect_to root_path
    end

end
