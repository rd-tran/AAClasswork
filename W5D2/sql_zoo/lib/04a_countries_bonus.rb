# == Schema Information
#
# Table name: countries
#
#  name        :string       not null, primary key
#  continent   :string
#  area        :integer
#  population  :integer
#  gdp         :integer

require_relative './sqlzoo.rb'

def highest_gdp
  # Which countries have a GDP greater than every country in Europe? (Give the
  # name only. Some countries may have NULL gdp values)
  execute(<<-SQL)
    /*
    SELECT
      countries.name
    FROM
      countries
    WHERE
      countries.gdp > (
        SELECT
          MAX(countries.gdp)
        FROM
          countries
        WHERE
          countries.continent = 'Europe'
      )
    */

    SELECT
      countries.name
    FROM
      countries
    JOIN
      countries AS europeans ON europeans.continent = 'Europe'
    GROUP BY
      countries.name,
      countries.gdp
    HAVING
      countries.gdp > MAX(europeans.gdp)
  SQL
end

def largest_in_continent
  # Find the largest country (by area) in each continent. Show the continent,
  # name, and area.
  execute(<<-SQL)
    /*
    SELECT
      countries.continent,
      countries.name,
      countries.area
    FROM
      countries
    WHERE
      countries.area = (
        SELECT
          MAX(continents.area)
        FROM
          countries AS continents
        WHERE
          countries.continent = continents.continent
      )
    */
    SELECT
      countries.continent,
      countries.name,
      countries.area
    FROM
      countries
    JOIN
      countries AS continents ON countries.continent = continents.continent
    GROUP BY
      countries.continent,
      countries.name,
      countries.area,
      continents.continent
    HAVING
      countries.area = MAX(continents.area)
  SQL
end

def large_neighbors
  # Some countries have populations more than three times that of any of their
  # neighbors (in the same continent). Give the countries and continents.
  execute(<<-SQL)
    /*
    SELECT
      countries.name,
      countries.continent
    FROM
      countries
    WHERE
      countries.population > 3 * (
        SELECT
          MAX(other_countries.population)
        FROM
          countries AS other_countries
        WHERE
          countries.continent = other_countries.continent AND
            other_countries.name != countries.name
      )
    */

    SELECT
      countries.name,
      countries.continent
    FROM
      countries
    JOIN
      countries AS neighbors ON countries.continent = neighbors.continent AND
      countries.name != neighbors.name
    GROUP BY
      countries.name,
      countries.continent,
      countries.population,
      neighbors.continent
    HAVING
      countries.population > 3 * MAX(neighbors.population)
  SQL
end
