class Movie < ApplicationRecord

  has_many :reviews
  has_many :actors, :through => :actors_movies

  validates :title, :director, :description, :poster_image_url, :release_date, :categories,
    presence: true

  validates :runtime_in_minutes,
    numericality: { only_integer: true}

  validate :release_date_is_in_the_past

  def review_average
    reviews.sum(:rating_out_of_ten)/reviews.size unless :rating_out_of_ten == 0
  end

  protected

  def release_date_is_in_the_past
    if release_date.present?
      errors.add(:release_date, "should be in the past") if release_date > Date.today
    end
  end
end
