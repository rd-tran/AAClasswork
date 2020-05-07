class QuestionLike
  attr_accessor :question_id, :user_id

  def self.find_by_id(id)
    data = QuestionsDB.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        question_likes
      WHERE
        question_likes.question_id == ?
    SQL
    data.map { |datum| QuestionLike.new(datum)}
  end

  def self.likers_for_question_id(question_id)
    data = QuestionsDB.instance.execute(<<-SQL, question_id)
      SELECT
        question_likes.user_id
      FROM
        question_likes
      WHERE
        question_likes.question_id = ?
    SQL
    data.map do |hash|
      QuestionLike.new(hash['user_id'])
    end
  end

  def self.num_likes_for_question_id(question_id)
    data = QuestionsDB.instance.execute(<<-SQL, question_id)
      SELECT
        COUNT(question_likes.user_id) AS num_likes
      FROM
        question_likes
      WHERE
        question_likes.question_id = ?
    SQL
    data.first['num_likes']
  end

  def self.liked_questions_for_user_id(user_id)
    data = QuestionsDB.instance.execute(<<-SQL, user_id)
      SELECT
        question_likes.question_id
      FROM
        question_likes
      WHERE
        question_likes.user_id = ?
    SQL
    data.map do |hash|
      Question.find_by_id(hash['question_id'])
    end
  end

  def self.most_liked_questions(n)
    data = QuestionsDB.instance.execute(<<-SQL, n)
      SELECT
        question_likes.question_id
      FROM
        question_likes
      JOIN
        questions ON questions.id = question_liked.question_id
      GROUP BY
        question_id
      ORDER BY
        COUNT(question_likes.user_id) DESC
      LIMIT
        ?
    SQL
    data.map do |data_hash|
      Question.find_by_id(data_hash['question_id'])
    end
  end

  def initialize(options)
    @question_id = options['question_id']
    @user_id = options['user_id']
  end
end