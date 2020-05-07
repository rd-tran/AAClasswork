class QuestionFollow
  attr_accessor :question_id, :user_id

  def self.find_by_id(id)
    data = QuestionsDB.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        question_follows
      WHERE
        questions.question_id == ?
    SQL
    data.map { |datum| QuestionFollow.new(datum)}
  end

  def self.followers_for_question_id(question_id)
    data = QuestionsDB.instance.execute(<<-SQL, question_id)
      SELECT
        users.id
      FROM
        users
      JOIN
        question_follows ON question_follows.user_id = users.id
      WHERE
        question_follows.question_id = ?
    SQL
    data.map do |data_hash|
      User.find_by_id(data_hash['id'])
    end
  end

  def self.followed_questions_for_user_id(user_id)
    data = QuestionsDB.instance.execute(<<-SQL, user_id)
      SELECT
        questions.id
      FROM
        questions
      JOIN
        question_follows
        ON question_follows.question_id = questions.id
      JOIN
        users
        ON users.id = questions.id
      WHERE
        question_follows.user_id = ?
    SQL
    data.map do |data_hash|
      Question.find_by_id(data_hash['id'])
    end
  end

  def self.most_followed_questions(n)
    data = QuestionsDB.instance.execute(<<-SQL, n)
      SELECT
        question_follows.question_id
      FROM
        question_follows
      JOIN
        questions ON questions.id = question_follows.question_id
      GROUP BY
        question_id
      ORDER BY
        COUNT(question_follows.user_id) DESC
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