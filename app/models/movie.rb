class Movie < ApplicationRecord
  scope :search_title, ->(title) { where(title: title)}
  scope :search_director, ->(director) {where(director: director)}

  has_many :reviews
  has_many :actors, :through => :actors_movies
  mount_uploader :image, ImageUploader

  validates :title, :director, :description, :release_date, :catagories,
    presence: true

  validates :runtime_in_minutes,
    numericality: { only_integer: true}

  validate :release_date_is_in_the_past

  def review_average
    reviews.sum(:rating_out_of_ten)/reviews.size unless :rating_out_of_ten == 0
  end

  def self.search_duration(params)
    case params
    when :under_90
      where("runtime_in_minutes < 90")
    when :between_90_120
      where("runtime_in_minutes >= 90 && runtime_in_minutes <= 120")
    when :over_120
      where("runtime_in_minutes > 120")
    end
  end

  protected

  def release_date_is_in_the_past
    if release_date.present?
      errors.add(:release_date, "should be in the past") if release_date > Date.today
    end
  end
end
