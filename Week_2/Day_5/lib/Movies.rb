require 'imdb'

class Movies
  def initialize
  end

  def search(term)

    searched_movies = Imdb::Search.new(term).movies[1..20]
    searched_movies_with_posters = searched_movies.select {|x| x.poster != nil}
    return searched_movies_with_posters.first(9)

  end

end
