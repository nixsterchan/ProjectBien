

class ReviewsController < ApplicationController

    # check if logged in
    before_action :check_login, except: [:index, :show,]

    def index 
        # list page for reviews function

        # <% %> is a ruby functionality that allows us to put in the variable defined here into the html.erb file
        # very first touch on dynamic coding in ruby so its very important to remember 
        
        # we find these from the url first
        @price = params[:price]
        @cuisine = params[:cuisine]
        @location = params[:location]

        # start with all the reviews
        @reviews = Review.all

        # filtering by price (if it exists)
        if @price.present?
            @reviews = @reviews.where(price: @price)
        end

        # filtering by cuisine
        if @cuisine.present?
            @reviews = @reviews.where(cuisine: @cuisine)
        end

        # search near the location given   (here we use 'near', that has been given to us by geocoder)
        if @location.present?
            @reviews = @reviews.near(@location)
        end

    end


    def new 
        # new review 
        # we will be making a model here, by taking our controller and making a new mode, then giving it to our html to make a form
        @review = Review.new
    end

    def create
        # takes info from the form and add to the database
        # create new row in database and save
        @review = Review.new(form_params) 

        # # save to database
        # @review.save

        # # redirect back to homepage
        # redirect_to root_path

        # we want to check if the model can be saved
        # if it is, we go to the home page again
        # if it isn't, we show the new form

        if @review.save
            redirect_to root_path
        else
            # show the view for new.html.erb
            render "new"
        end


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
    
    def edit
        # find individual review to edit
        @review = Review.find(params[:id])
        
    end

    def update
        # find individual review
        @review = Review.find(params[:id])

        # update with new info from the form
        if @review.update(form_params)

            # redirect somewhere new
            redirect_to review_path(@review)
        else
            render "edit"
        end
    end

    def form_params
        # can use this within rails and any part of this controller
        params.require(:review).permit(:title, :restaurant, :body, :score, :ambience,
             :cuisine, :price, :address)
    end

end



