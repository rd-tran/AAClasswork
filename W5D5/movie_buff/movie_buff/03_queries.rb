def what_was_that_one_with(those_actors)
  # Find the movies starring all `those_actors` (an array of actor names).
  # Show each movie's title and id.
  Movie
    .select(:title, :id)
    .joins(:actors)
    .where(actors: { name: those_actors })
    .group(:id)
    .having('COUNT(actors.id) = ?', those_actors.length)
end

def golden_age
  # Find the decade with the highest average movie score.
  Movie
    .select('(movies.yr / 10) * 10 AS decade')
    .group('decade')
    .order('AVG(movies.score) DESC')
    .first
    .decade
end

def costars(name)
  # List the names of the actors that the named actor has ever
  # appeared with.
  # Hint: use a subquery

  #! Given solution
  # subquery =
  #   Movie
  #     .select(:id)
  #     .joins(:actors)
  #     .where(actors: { name: name })

  # Movie
  #   .joins(:actors)
  #   .where(id: subquery)
  #   .where.not(actors: { name: name })
  #   .pluck('DISTINCT actors.name')

  #! Alternative solution
  Movie
    .joins(:actors)
    .joins('INNER JOIN castings AS target_castings ON movies.id = target_castings.movie_id')
    .joins('INNER JOIN actors AS target_actors ON target_actors.id = target_castings.actor_id')
    .where(target_actors: {name: name})
    .where.not(actors: {name: name})
    .pluck('DISTINCT actors.name')
  
  #! THIS IS THE SAME AS DOING THIS
  # SELECT
  #   DISTINCE actors.name
  # FROM
  #   movies
  # JOIN
  #   castings ON movies.id = castings.movie_id
  # JOIN
  #   actors ON actors.id = castings.actor_id
  # JOIN
  #   castings AS target_castings ON movies.id = target_castings.movie_id
  # JOIN
  #   actors as target_actor ON target_actor.id = target_castings.actor_id
  # WHERE
  #   target_actor.name = name
  #   AND
  #   actors.name != name
end

def actor_out_of_work
  # Find the number of actors in the database who have not appeared in a movie
  Actor
    .select(:name)
    .joins('LEFT JOIN castings on actors.id = castings.actor_id')
    .where(castings: { movie_id: nil})
    .count
end

def starring(whazzername)
  # Find the movies with an actor who had a name like `whazzername`.
  # A name is like whazzername if the actor's name contains all of the
  # letters in whazzername, ignoring case, in order.

  # ex. "Sylvester Stallone" is like "sylvester" and "lester stone" but
  # not like "stallone sylvester" or "zylvester ztallone"
  like = '%' + whazzername.split('').join('%') + '%'

  Movie
    .joins(:actors)
    .where('LOWER(actors.name) LIKE LOWER(?)', like)
end

def longest_career
  # Find the 3 actors who had the longest careers
  # (the greatest time between first and last movie).
  # Order by actor names. Show each actor's id, name, and the length of
  # their career.
  Actor
    .select('actors.id, actors.name, MAX(movies.yr) - MIN(movies.yr) AS career')
    .joins(:movies)
    .group(:id, :name)
    .order('career DESC, name')
    .limit(3)
end
