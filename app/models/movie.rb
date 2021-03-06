class Movie < ApplicationRecord

  has_many :reviews, dependent: :destroy
  has_many :actors, :through => :actors_movies
  mount_uploader :image, ImageUploader

  validates :title, :director, :description, :release_date, :catagories,
    presence: true

  validates :runtime_in_minutes,
    numericality: { only_integer: true}

  validate :release_date_is_in_the_past

  def review_average
    unless reviews.empty?
      reviews.sum(:rating_out_of_ten)/reviews.size unless :rating_out_of_ten == 0
    end
  end

  protected

  def release_date_is_in_the_past
    if release_date.present?
      errors.add(:release_date, "should be in the past") if release_date > Date.today
    end
  end
end
