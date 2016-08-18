class MoviesController < ApplicationController
  before_action :current_user

   def index
    sort = params[:sort] || :release_date
    @movies = Movie.order(sort)
   end

   def show
     @movie = Movie.find(params[:id])
   end

   def new
     @movie = Movie.new
   end

   def edit
     @movie = Movie.find(params[:id])
   end

   def create
     @movie = Movie.new(movie_params)

     if @movie.save
       redirect_to movies_path, notice: "#{@movie.title} was submitted successfully!"
     else
       render :new
     end
   end

   def update
     @movie = Movie.find(params[:id])
     if @movie.update_attributes(movie_params)
       redirect_to movie_path(@movie)
     else
       render :edit
     end
   end

   def destroy
     @movie = Movie.find(params[:id])
     @movie.destroy
     redirect_to movies_path
   end

   def search
     search = params[:search][:data]
     @movies = Movie.where("title LIKE ?", "%#{search}%")
     @movies += Movie.where("director LIKE ?", "%#{search}%")
     @movies = @movies.uniq
   end

   protected

   def movie_params
     params.require(:movie).permit(
       :title, :release_date, :director, :runtime_in_minutes, :image, :remote_image_url, :description, :catagories
     )
   end

 end
