module ReviewsHelper
  def average_rating(ratings)
    ratings_array = ratings.map(&:rating)
    ratings_array.inject{|sum, el| sum + el}.to_f       
  end
end
