require_relative 'db_connection'
require 'active_support/inflector'
# require "byebug"
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    return @columns if @columns

    @columns = DBConnection.execute2(<<-SQL).first.map(&:to_sym)
      SELECT
        *
      FROM
        #{table_name}
    SQL
  end

  def self.finalize!
    columns.each do |column|
      define_method(column) do
        self.attributes[column]
      end

      define_method("#{column}=") do |val|
        self.attributes[column] = val
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name 
  end

  def self.table_name
    @table_name ||= self.name.tableize
  end

  def self.all
    results = DBConnection.execute(<<-SQL)
      SELECT
        #{table_name}.*
      FROM
        #{table_name}
    SQL

    parse_all(results)
  end

  def self.parse_all(results)
    results.map { |result| self.new(result) }
  end

  def self.find(id)
    results = DBConnection.execute(<<-SQL, id)
      SELECT
        #{table_name}.*
      FROM
        #{table_name}
      WHERE
        #{table_name}.id = ?
    SQL

    parse_all(results).first
  end

  def initialize(params = {})
    params.each do |attribute, value|
      if self.class.columns.include?(attribute.to_sym)
        self.send("#{attribute}=", value)
      else
        raise "unknown attribute '#{attribute}'"
      end
    end
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    attributes.values
  end

  def insert
    column_names = self.class.columns.drop(1).map(&:to_s).join(', ')
    question_marks = Array.new(self.class.columns.length - 1, '?').join(', ')

    DBConnection.execute(<<-SQL, *attribute_values)
      INSERT INTO
        #{self.class.table_name} (#{column_names})
      VALUES
        (#{question_marks})
    SQL

    self.id = DBConnection.last_insert_row_id
  end

  def update
    set_columns = self.class.columns.map { |column| "#{column} = ?" }.join(', ') 

    DBConnection.execute(<<-SQL, *attribute_values, self.id)
      UPDATE
        #{self.class.table_name}
      SET
        #{set_columns}
      WHERE
        #{self.class.table_name}.id = ?
    SQL
  end

  def save
    self.id ? self.update : self.insert
  end
end
