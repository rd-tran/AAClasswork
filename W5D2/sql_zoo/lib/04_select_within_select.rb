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

# A note on subqueries: we can refer to values in the outer SELECT within the
# inner SELECT. We can name the tables so that we can tell the difference
# between the inner and outer versions.

def example_select_with_subquery
  execute(<<-SQL)
    SELECT
      name
    FROM
      countries
    WHERE
      population > (
        SELECT
          population
        FROM
          countries
        WHERE
          name='Romania'
      );
  SQL
end

def larger_than_russia
  # List each country name where the population is larger than 'Russia'.
  execute(<<-SQL)
    /*
    SELECT
      countries.name
    FROM
      countries
    WHERE
      countries.population > (
        SELECT
          population
        FROM
          countries AS russia
        WHERE
          russia.name = 'Russia'
      )
    */

    SELECT
      countries.name
    FROM
      countries
    JOIN
      countries AS russia ON countries.population > russia.population
    WHERE
      russia.name = 'Russia';
  SQL
end

def richer_than_england
  # Show the countries in Europe with a per capita GDP greater than
  # 'United Kingdom'.
  execute(<<-SQL)
  /*
    SELECT
      countries.name
    FROM
      countries
    WHERE
      countries.gdp / countries.population > (
        SELECT
          europeans.gdp / europeans.population
        FROM
          countries AS europeans
        WHERE
          europeans.continent = 'Europe'
      )
  */

    SELECT
      other.name
    FROM
      countries AS other
    JOIN
      countries AS uk ON (other.gdp / other.population) > (uk.gdp / uk.population)
    WHERE
      uk.name = 'United Kingdom' AND
        other.continent = 'Europe'
  SQL
end

def neighbors_of_certain_b_countries
  # List the name and continent of countries in the continents containing
  # 'Belize', 'Belgium'.
  execute(<<-SQL)
    /*
    SELECT
      countries.name,
      countries.continent
    FROM
      countries
    WHERE
      countries.continent = (
        SELECT
          belz_belg.continent
        FROM
          countries AS belz_belg
        WHERE
          belz_belg.name IN ('Belize', 'Belgium')
      )
    */

    SELECT
      other.name,
      other.continent
    FROM
      countries AS other
    JOIN
      countries AS belz_belg ON other.continent = belz_belg.continent
    WHERE
      belz_belg.name IN ('Belize', 'Belgium')
  SQL
end

def population_constraint
  # Which country has a population that is more than Canada but less than
  # Poland? Show the name and the population.
  execute(<<-SQL)
    /*
    SELECT
      countries.name,
      countries.population
    FROM
      countries
    WHERE
      countries.population > (
        SELECT
          canada.population
        FROM
          countries AS canada
        WHERE
          canada.name = 'Canada'
      )
      AND
      countries.population < (
        SELECT
          poland.population
        FROM
          countries AS poland
        WHERE
          poland.name = 'Poland'
      )
    */

    SELECT
      others.name,
      others.population
    FROM
      countries AS others
    JOIN
      countries AS canada ON others.population > canada.population
    JOIN
      countries AS poland ON others.population < poland.population
    WHERE
      canada.name = 'Canada' AND
        poland.name = 'Poland'
  SQL
end

def sparse_continents
  # Find every country that belongs to a continent where each country's
  # population is less than 25,000,000. Show name, continent and
  # population.
  # Hint: Sometimes rewording the problem can help you see the solution.
  execute(<<-SQL)
    /*
    SELECT
      countries.name,
      countries.continent,
      countries.population
    FROM
      countries
    WHERE
      countries.continent IN (
        SELECT
          small_countries.continent
        FROM
          countries AS small_countries
        GROUP BY
          small_countries.continent
        HAVING
          MAX(small_countries.population) < 25000000
      )
    */
    
    SELECT
      countries.name,
      countries.continent,
      countries.population
    FROM
      countries
    JOIN
      countries AS continent ON countries.continent = continent.continent
    GROUP BY
      countries.name,
      countries.continent,
      countries.population,
      continent.continent
    HAVING
      MAX(continent.population) < 25000000
  SQL
end